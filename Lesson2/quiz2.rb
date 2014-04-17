#1)
a = 1 
=> ex. a is a local variable, available only within the current block of code,
# and is a Fixnum object with value of 1. 
@a = 2
# => @a is an instance variable, available throughout the class,
# and is a Fixnum with a value of 2.
user = User.new
# => User is a class name, .new calls on the intialize method of that class to create
# a new object. The properties of that new object are stored in the local variable user.
user.name
# => user is the local variable storing the new User class object, .name calls on the 
# @name variable within the User class.
user.name = "Joe"
# => this sets the name variable of the user to the string Joe.

#2)
# You can mixin a module to a class by adding
include modulename
# within the class

#3)
# A class variable is set within the class by:
@@classvariable = value
# and sets that value for the superclass and all subclasses.
# An instance variable is also within the class and is set by:
@instancevariable = value
# and only applies to the current class.

#4)
attr_accessor :variable
# establishes the getter and setter methods for the variable within the class.

#5)
Dog.some_method
# is calling some_method on the class Dog. Within the Dog class there should be a method
# called some_method that performs some action.

#6)
# Subclasses simply inherit the qualities of their Superclasses. By establishing a module 
# you can use the functions of that module within more than one class.

#7)
class User
  attr_accessor :name

  def initialize(name)
    self.name = name
  end
end

#8)
# Yes.

#9)
# if you have the pry gem installed you can put
require 'pry'
# at the top of your code and then put
binding.pry
# where you want to stop the code and find the error.




