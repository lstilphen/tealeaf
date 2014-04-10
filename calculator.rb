require 'pry'
def say(msg)
	puts "=> #{msg}"
end

say "What is the first number?"
num1 = gets.chomp

say "What's the second number?"
num2 = gets.chomp

say "1) add 2) substract 3) multiply 4) divide"
operator = gets.chomp

puts "Numbers: #{num1} #{num2}. You chose #{operator}"

binding.pry 
if operator == '1'
	result = num1.to_i + num2.to_i
elsif operator == '2'
	result = num1.to_i - num2.to_i
elsif operator == '3'
	result = num1.to_i * num2.to_i
else operator == '4'
	result = num1.to_f / num2.to_f
end

puts "Result is #{result}"