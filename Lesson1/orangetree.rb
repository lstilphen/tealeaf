class OrangeTree
	def initialize
		@height = 0
		@age = 0
		@orange_count = 0
		puts "A new tree is planted!"
	end

	def height
		@height = @age * 2
		puts "Your tree is #{@height}ft. tall"
	end

	def one_year_passes
		@age = @age + 1
		if @age >= 60
			puts "Your tree has died."
			exit
		else
			@orange_count = 10
		end
	end

	def count_oranges
		if @age <= 4
			@orange_count = 0
			puts "Your tree hasn't begun to produce fruit."
		else
			puts "You have #{@orange_count} oranges."
		end
	end
	
	def pick_oranges
		if @orange_count == 0
			puts "There aren't any oranges!"
		else
			@orange_count = @orange_count -1
			puts "You ate an orange. It was delicous!"
		end
	end

end

tree = OrangeTree.new
tree.one_year_passes
tree.one_year_passes
tree.one_year_passes
tree.one_year_passes
tree.one_year_passes
tree.one_year_passes
tree.one_year_passes
tree.one_year_passes
tree.height
tree.count_oranges
tree.pick_oranges
tree.count_oranges
tree.one_year_passes
tree.count_oranges
