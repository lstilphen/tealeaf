a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
odds = a.select {|x| x % 2 != 0}
odds.push(11)
odds.unshift(0)
puts odds.join(", ")