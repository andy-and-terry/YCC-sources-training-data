module Greetable
  def greet : String
    "Hello, #{name}!"
  end
end

class Person
  include Greetable

  def initialize(@name : String)
  end

  def name : String
    @name
  end
end

puts Person.new("Ada").greet
