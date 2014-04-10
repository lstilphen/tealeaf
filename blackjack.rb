puts "What is your name?"
name = gets.chomp

deck = {'Ace' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'Jack' =>  10, 'Queen' => 10, 'King' => 10}

hand = Array.new []

puts "Hello, #{name}, here is your first card:"
	card = deck.keys.sample
	puts card
	hand.push card

total = hand.inject{|sum,x| sum + x }

puts "Would you like another card? ('yes' or 'no')"
	reply = gets.chomp
		if reply == 'yes'
			card2 = deck.keys.sample
			puts "Your next card is #{card2}."
			hand.push card2
			puts "Your hand is #{hand.to_s} for a total of #{total}."
		elsif reply == 'no'
		  puts "Your final hand is #{hand.to_s} for a total of #{total}."
		end
