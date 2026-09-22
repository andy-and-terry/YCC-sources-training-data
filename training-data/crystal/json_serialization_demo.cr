require "json"

class Person
  include JSON::Serializable

  property name : String
  property age : Int32

  def initialize(@name : String, @age : Int32)
  end
end

person = Person.new("Ada", 30)
json = person.to_json
puts json

parsed = Person.from_json(json)
puts "#{parsed.name} is #{parsed.age}"
