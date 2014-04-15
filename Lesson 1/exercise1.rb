a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
odds = a.select {|x| x % 2 != 0}
odds.push(3)
odds.unshift(0)
puts odds.uniq.join(", ")

#Arrays are indexed collections
#Hashes are collections of key-value pairs

h = {a:1, b:2, c:3, d:4}
puts h[:b]
h.merge!(:e => 5)
puts h
h.delete_if{|key, value| value < 3.5}
puts h

# Yes, examples:
array = [{a:1, b:2}, {c:3, d:4}]
puts array
puts array[1]
hash = {a:[1,2,3], b:[4,5,6]}
puts hash
puts hash[:b]

