class Animal # <-- superclass
    attr_accessor :name

  def initialize(n)
    @name = n
  end

  def eat
    "#{name} is eating."
  end

  def speak
    "#{name} speaks!"
  end
end

class Mammal < Animal
  def warm_blooded?
    true
  end
end

module Swimable # <-- end with 'able', wins over Superclass if same method.
  def swim
    "#{name} is swimming!"
  end
end

module Fetchable
  def fetch
    "#{name} is fetching!"
  end
end

class Dog < Mammal # <-- subclass
  include Swimable # <-- allows Dog to access Swimable module
  include Fetchable
  #def fetch
    #{}"#{name} is fetching!"
  #end

  def speak
    "#{name} is barking!"
  end

end

class Cat < Mammal

end

dog1 = Dog.new('teddy')
puts dog1.name
puts dog1.eat
puts dog1.fetch
puts dog1.speak
puts dog1.warm_blooded?
puts dog1.swim
puts dog1.fetch

cat1 = Cat.new('kitty')
puts cat1.name
puts cat1.eat


# puts Dog.ancestors <-- shows the classes to which it belongs.