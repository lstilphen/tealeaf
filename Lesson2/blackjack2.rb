
class Card
  attr_accessor :suit, :value

  def initialize(s, v)
    @suit = s
    @value = v
  end

  def to_s
    "#{@value} of #{@suit}."
  end
end

class Deck 
  attr_accessor :cards

  def initialize
    @cards = []
    ['Hearts', 'Diamonds', 'Spades', 'Clubs'].each do |suit|
      ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].each do |value|
        @cards << Card.new(suit, value)
      end
    end
     shuffle_cards
  end

  def shuffle_cards
    cards.shuffle!
  end

  def deal
    cards.pop
  end

end

module Hand
  def show_hand
    puts " --- #{name}'s hand: ---"
    cards.each do |card|
      puts "#{card.to_s}"
    end
      puts " > Total: #{total}"
  end

  def total
    values = cards.map{|card| card.value }
    total = 0

      values.each do |val|
        if val == 'A'
          total += 11
        else
          total += (val.to_i == 0 ? 10 : val.to_i)
        end
      end

      values.select{|val| val == 'A'}.count.times do
        break if total <= 21
        total -= 10
      end

      total
  end

  def add_card(new_card)
    cards << new_card
  end

  def is_busted?
    total > Blackjack::BLACKJACK_AMOUNT
  end
end

class Player
  include Hand
  attr_accessor :name, :cards

  def initialize(n)
    @name = n
    @cards = []
  end

end


class Dealer
  include Hand
  attr_accessor :name, :cards

  def initialize
    @name = "Dealer"
    @cards = []
  end

  def show_flop
    puts " --- Dealer's Hand ---"
    puts "First card is hidden."
    puts "Second card is #{cards[1]}"
  end

end

class Blackjack
  attr_accessor :deck, :player, :dealer

  BLACKJACK_AMOUNT = 21
  DEALER_HIT_MIN = 17

  def initialize
    @deck = Deck.new
    @player = Player.new("Player 1")
    @dealer = Dealer.new
  end

  def set_player_name
    puts "What's your name?"
    player.name = gets.chomp
  end

  def deal_cards
    player.add_card(deck.deal)
    dealer.add_card(deck.deal)
    player.add_card(deck.deal)
    dealer.add_card(deck.deal)
  end

  def show_flop
    player.show_hand
    dealer.show_flop
  end

  def blackjack_or_bust?(player_or_dealer)
    if player_or_dealer.total == BLACKJACK_AMOUNT
      if player_or_dealer.is_a?(Dealer)
        puts "Dealer hit blackjack! #{player.name} lost."
      else
        puts "You hit blackjack! #{player.name} wins!"
      end
      play_again?
    elsif player_or_dealer.is_busted?
      if player_or_dealer.is_a?(Dealer)
        puts "Dealer busted. #{player.name} wins!"
      else
        puts "Sorry, you busted. #{player.name} loses."
      end
      play_again?
    end
  end

  def player_turn
    puts "#{player.name}'s turn."
    blackjack_or_bust?(player)

    while !player.is_busted?
      puts ""
      puts "What would you like to do? 1) hit 2) stay"
      response = gets.chomp

      if !['1', '2'].include?(response)
        puts "ERROR! Please enter 1 or 2"
        next
      end
      
      if response == '2'
        puts "#{player.name} chose to stay."
        break
      end

      new_card = deck.deal
      puts "Your next card is: #{new_card}"
      player.add_card(new_card)
      puts "Your total is now: #{player.total}"

      blackjack_or_bust?(player)
    end

    puts "#{player.name} stays at #{player.total}."
  end

  def dealer_turn
    puts ""
    puts " --> Dealer's turn."

    blackjack_or_bust?(dealer)
    while dealer.total < DEALER_HIT_MIN
      new_card = deck.deal
      puts "Dealer's next card is: #{new_card}"
      dealer.add_card(new_card)
      puts "Dealer's total is now #{dealer.total}"

      blackjack_or_bust?(dealer)
    end

    puts "Dealer stays at #{dealer.total}"
  end

  def who_won?(player, dealer)
    if player.total > dealer.total
      puts "#{player.name} wins!"
    elsif player.total < dealer.total
      puts "#{player.name} loses."
    else
      puts "It's a tie!"
    end
    play_again?
  end

  def play_again?
    puts ""
    puts "Would you like to play again? 1) yes 2) no"
      if gets.chomp == '1'
        puts "Starting a new game..."
        deck = Deck.new
        player.cards = []
        dealer.cards = []
        start
      else
        puts "Goodbye!"
        exit
      end
  end

  def start
    set_player_name
    deal_cards
    show_flop
    player_turn
    dealer_turn
    who_won?(player, dealer)
  end

end

game = Blackjack.new
game.start