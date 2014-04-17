class Dog
  attr_accessor :name, :breed, :age

  @@count = 0 # <-- set the count to 0 when class created.

  def self.total_dogs
    "Total number of dogs: #{@@count}"
  end

  def initialize(n, b, a)
    @name = n
    @breed = b
    @age = a
    @@count += 1 # <-- every time a dog is created the count goes up 1.
  end

  def speak
    @name  +" Barks!"
  end

  #def name <-- :name replaces these methods
    #@name
  #end

  #def new_name(new_name)
    #@name = new_name
  #end

  def info
    "#{name} is a #{age} year old #{breed}." #<-- with @, calls getter on line 18. Don't need with accessor.
  end

  def update_info(n, b, a)
    self.name = n
    #@name = n <-- this will work, but .self is safer.
    self.breed = b
    self.age = a
  end

end

dog1 = Dog.new('Teddy', 'terrier', 4)
#dog2 = Dog.new('Fido', 'mastiff', 6)

puts dog1.speak

#puts dog1.name
#dog1.name ='Roosevelt'
#puts dog1.name
#puts dog1.breed
#puts dog1.age

puts dog1.info
dog1.update_info('Roosevelt', 'dalmation', 8)
puts dog1.info

puts Dog.total_dogs
