
birth = Time.local(1988, 3, 4, 6, 00)
puts birth
billion = birth + 1000000000
puts billion

puts "What year were you born?"
year = gets.chomp.to_i

current_year = Time.now.year

age = (current_year-year)
puts 'SPANK!'*age



