#def chime  <------------- easier method
	#hour = Time.new.hour
	
	#if hour < 12
		#puts "DING!" * hour
	#elsif hour > 12
		#puts "DING!" * (hour - 12)
	#end
#end

#chime

def clock &block #<--------- proc method
	hour = Time.new.hour

	if hour >= 13
		hour = 12
	end

	if hour == 0
		hour = 12
	end

	hour.times do
		block.call
	end
end

clock do
	puts "DING!"
end