require "json"

class Person
  include JSON::Serializable

  property name : String
  property age : Int32
end

json = %({"name":"Ada","age":36})
person = Person.from_json(json)
puts "#{person.name} is #{person.age}"
puts person.to_json
