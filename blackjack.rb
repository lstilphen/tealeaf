
def total(hand)
	cards = hand.map {|x| x[1]}
	total = 0
	cards.each do |value|
		if value == 'A'
			total += 11
		elsif value.to_i == 0
			total += 10
		elsif
			total += value.to_i
		end
	end

	cards.select{|x| x == 'A'}.count.times do
		if total > 21
			total -= 10
		end
	end

	if cards.include?('A') && total >21
		total += 10
	end
	return total
end

puts "Welcome! What is your name?"
name = gets.chomp

suits = ['Diamonds', 'Hearts', 'Spades', 'Clubs']
values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = suits.product(values)
deck.shuffle!

mycards = []
dealercards = []

mycards << deck.pop
dealercards << deck.pop
mycards << deck.pop
dealercards << deck.pop

mytotal = total(mycards)
dealertotal = total(dealercards)

puts "Hello, #{name}, you have #{mycards} for a total of #{mytotal}"
puts "The dealer has #{dealercards} for a total of #{dealertotal}"

if mytotal == 21
	puts 'You got blackjack! You win!'
	exit
end

while mytotal < 21
	puts "What would you like to do? 1) hit 2) stay?"
	reply = gets.chomp
	
	if !['1', '2'].include?(reply)
		puts 'Please select 1 or 2'
		next
	end

	if reply == "2"
		puts "You chose to stay."
		puts "Your final hand is #{mycards} for a total of #{mytotal}."
		break
	end

	mycards << deck.pop
	mytotal = total(mycards)
	puts "Your hand is now #{mycards} for a total of #{mytotal}"

	if mytotal == 21
		puts "You got Blackjack!"
		exit
	elsif mytotal > 21
		puts "You busted."
		exit
	end
end

	if dealertotal == 21
		puts "The dealer has blackjack! You lose."
		exit
	end

while dealertotal < 17
	dealercards << deck.pop
	dealertotal = total(dealercards)

	if dealertotal == 21
		puts "Dealer hit blackjack! You lose."
		exit
	elsif dealertotal > 21
		puts "Dealer's hand is #{dealercards} for a total of #{dealertotal}"
		puts "Dealer busted. You win!"
		exit
	end
end

puts "Dealer's final hand is #{dealercards} for a total of #{dealertotal}"
puts "Your final hand is #{mycards} for a total of #{mytotal}"

if mytotal > dealertotal
	puts "You win!"
	exit
elsif mytotal < dealertotal
	puts "You lose."
	exit
else
	puts "It's a tie!"
end
exit



