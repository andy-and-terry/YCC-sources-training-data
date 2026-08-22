module Greetable
  def greeting
    "Hello, #{name}!"
  end
end

class Person
  include Greetable
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

puts Person.new('Alice').greeting
