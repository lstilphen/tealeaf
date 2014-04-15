class Dragon

	def initialize name
		@name = name
		@asleep = false
		@stomach = 10 #full
		@bowels = 0 #doesn't need to go

		puts "#{@name} is born!"
	end

	def feed
		puts "You feed #{@name}."
		@stomach = 10
		passage_of_time
	end

	def walk
		puts "You walk #{@name}."
		@bowels = 0
		passage_of_time
	end

	def put_to_bed
		puts "You put #{@name} to bed."
		@asleep = true
		3.times do
			if @asleep
				passage_of_time
			end
			if @asleep
				puts "#{@name} snores."
			end
		end
		if @asleep
			@asleep = false
			puts "#{@name} wakes up."
		end
	end

	def toss
		puts "You toss #{@name} in the air."
		passage_of_time
	end

	def rock
		puts "You rock #{@name} gently."
		@asleep = true
		puts "He falls asleep."
		passage_of_time
		if @asleep
			@asleep = false
			puts "But he wakes up as you stop."
		end
	end

	private
	def hungry?
		@stomach <= 2
	end

	def poopy?
		@bowels >= 8
	end

	def passage_of_time
		if @stomach > 0
			@stomach = @stomach - 1
			@bowels = @bowels + 1
		else
			if @asleep
				@asleep = false
				puts "He wakes up suddenly!"
			end
			puts "#{@name} is starving! He ate you!"
			exit
		end

		if @bowels >= 10
			@bowels = 0
			puts "Oops! #{@name} had an accident..."
		end

		if hungry?
			if @asleep
				@asleep = false
				puts "He wakes up suddenly!"
			end
			puts "#{@name}'s stomach grumbles."
		end

		if poopy?
			if @asleep
				@asleep = false
				puts "He wakes up suddenly!"
			end
			puts "#{@name} has to GO!"
		end
	end
end

pet = Dragon.new 'Viseron'

while true
puts "What would you like to do? 1)feed 2)walk 3)put to bed 4)toss 5)rock 6)nothing"
reply = gets.chomp

	if reply == '1'
		pet.feed
	elsif reply == '2'
		pet.walk
	elsif reply == '3'
		pet.put_to_bed
	elsif reply == '4'
		pet.toss
	elsif reply == '5'
		pet.rock
	elsif reply == '6'
		exit
	else
		puts "Please select a number 1-5"
	end
end

