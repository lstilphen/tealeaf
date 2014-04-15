class Integer 
	def to_eng
		if self == 5 
			english = 'five'
		else
			english = 'forty-two' 
		end

english
	end 
end

puts 5.to_eng
puts 42.to_eng


class Die

	def roll
		@number = 1 + rand(6)
	end

	def showing
		@number
end

die = Die.new
die.roll
puts die.showing
end