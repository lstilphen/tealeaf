
birth = Time.local(1988, 3, 4, 6, 00)
puts birth
billion = birth + 1000000000
puts billion

puts "In what month were you born?"
month = gets.chomp

puts "What day?"
day = gets.chomp.to_i

puts "What year?"
year = gets.chomp.to_i

puts "Your Birthday: #{month} #{day}, #{year}"

current_year = Time.now.year

age = (current_year-year)
puts 'SPANK!'* age



