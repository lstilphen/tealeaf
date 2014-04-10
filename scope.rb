array = [1,2,3]
array.each do |x|
	x = 4
	puts x
	# y = 3
end
puts array.join(", ")
# puts y -> undefined local variable

def method(var)
	puts var.length
end

method(array)

def next_meth(var)
	var.push(4)
	puts var.join(", ")
end

next_meth(array)
