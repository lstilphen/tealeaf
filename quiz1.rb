#1)
a = 1
b = a
b = 3

puts a 
# --> The value of a is 1 because the second and third lines 
# --> only change the value of b.

#2) Arrays are index-based lists that have a maintained order.
#Hashes are collections of key and value pairs that have no specific order.

#3)
arr = [1,2,3,3]
[1,2,3,3].uniq
[1,2,3,3].uniq! # <-- Both of these return the unchanged array.
puts arr.uniq.join(', ') # <-- This returns the array without the extra 3
arr.uniq! # <-- This changes the original array.
puts arr.join(', ') # <-- This return the changed array.

#4)
array = [5,6,7,8]
puts array.map { |a| 2 * a }.join(', ')
# .map runs the code to change the original array.

array2 = [4,5,13,16]
puts array2.select { |a| a.even? }.join(', ')
# .select only finds and returns values in the array that are true according to the code.

#5)
hash = {'apple' => 'red', 'banana' => 'yellow', 'grape' => 'green'}
puts hash['apple'] # <-- puts red

#6)
x = 1
puts x.odd? ? "yes" : "no" # <-- This evaluates for odd and puts the true value of 'yes'

#7)
x = 1
3.times do
	x += 1
end

#puts x # <-- x is now 4 because 1 was added to the original 1 three times.

#8)
3.times do
	x += 1
end

puts x # <-- x is nil because it was not declared originally.
