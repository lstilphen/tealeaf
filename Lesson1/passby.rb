# I switched these two exercises so techinically this is the scope one...

var = "cat"
var2 = 4

if var == "dog"
	puts "woof"
else
	puts "not a dog"
	# var = "elephant"
end
puts var #--> puts elephant

def length(a)
	puts a.length
end

length(var)

def add(b)
	puts b + " is an animal."
end

add(var)

if var == "zebra"
	if var2 == 4
		puts "yes"
	else
		puts "no"
	end
else
	puts "not a zebra"
end