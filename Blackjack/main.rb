require 'rubygems'
require 'sinatra'

set :sessions, true

BLACKJACK_AMOUNT = 21
DEALER_MIN_HIT = 17

helpers do
  def total(cards)
    values = cards.map{|card| card[1] }
    total = 0

      values.each do |val|
        if val == 'A'
          total += 11
        else
          total += (val.to_i == 0 ? 10 : val.to_i)
        end
      end

      values.select{|val| val == 'A'}.count.times do
        break if total <= BLACKJACK_AMOUNT
        total -= 10
      end

      total
  end

  def card_image(card)
    suit = card[0]
    value = card[1]

      "<img src= '/images/cards/#{suit}_#{value}.jpg' class='card_image' >"
  end

  def winner!(msg)
    @success = "<strong>#{session[:player]} wins!</strong> #{msg}"
    @show_buttons = false
    @play_again = true
  end

  def loser!(msg)
    @error = "<strong>#{session[:player]} loses!</strong> #{msg}"
    @show_buttons = false
    @play_again = true
  end

  def tie!(msg)
    @success = "<strong>It's a tie!</strong> #{msg}"
    @show_buttons = false
    @play_again = true
  end

end

before do
  @show_buttons = true
  @dealer_button = false
end

get '/' do
  if session[:player]
    redirect '/game'
  else
    redirect '/new_player'
  end
end

get '/new_player' do
  erb :new_player
end

post '/savename' do
  if params[:player].empty?
    @error = "Please enter your name."
    halt erb(:new_player)
  end

  session[:player] = params[:player]
  redirect '/bet'
end

get '/bet' do
  erb :bet
end

post '/setbet' do
  session[:bet] = params[:bet]
  redirect '/game'
end

get '/game' do
  session[:turn] = session[:player]

  # deck
  suits = ['hearts', 'diamonds', 'clubs', 'spades']
  values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace']
  session[:deck] = suits.product(values).shuffle!
  # deal cards
  session[:dealer_cards] = []
  session[:player_cards] = []
  session[:dealer_cards] << session[:deck].pop
  session[:player_cards] << session[:deck].pop
  session[:dealer_cards] << session[:deck].pop
  session[:player_cards] << session[:deck].pop
  erb :game
end

post '/game/player/hit' do

  session[:player_cards] << session[:deck].pop
  playertotal = total(session[:player_cards])
    if playertotal == BLACKJACK_AMOUNT
      winner!("#{session[:player]} got blackjack!")
    elsif playertotal > BLACKJACK_AMOUNT
      loser!("#{session[:player]} busted with #{playertotal}.")
    end
  
  erb :game
  
end

post '/game/player/stay' do
  @show_buttons = false
  @dealer_button = true

  redirect '/game/dealer'
  
end

get '/game/dealer' do
  @stay = "#{session[:player]} has chosen to stay with a total of #{total(session[:player_cards])}"
  session[:turn] = "dealer"
  @show_buttons = false

  dealertotal = total(session[:dealer_cards])

  if dealertotal == BLACKJACK_AMOUNT
    loser!("Dealer hit blackjack!")
    @dealer_button = false
  elsif dealertotal > BLACKJACK_AMOUNT
    winner!("Dealer busted with #{dealertotal}.")
    @dealer_button = false
  elsif dealertotal >= DEALER_MIN_HIT
    # stays
    redirect '/game/compare'
  else
    # hits
    @dealer_button = true
  end

  erb :game
end

post '/game/dealer/hit' do
  session[:dealer_cards] << session[:deck].pop
  redirect '/game/dealer'
end

get '/game/compare' do
  @show_buttons = false
  playertotal = total(session[:player_cards])
  dealertotal = total(session[:dealer_cards])

  if playertotal < dealertotal
    loser!("#{session[:player]} stayed at #{playertotal}. Dealer stayed at #{dealertotal}.")
  elsif playertotal > dealertotal
    winner!("#{session[:player]} stayed at #{playertotal}. Dealer stayed at #{dealertotal}.")
  else
    tie!("#{session[:player]} and Dealer stayed at #{playertotal}.")
  end

  erb :game
end

get '/game_over' do
  erb :game_over
end

