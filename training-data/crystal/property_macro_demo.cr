# getter / setter / property macros generate accessors.
class Person
  getter name : String
  property age : Int32
  setter nickname : String?

  def initialize(@name : String, @age : Int32)
  end

  def nickname
    @nickname || @name
  end
end

p = Person.new("Alice", 30)
p.age += 1
puts "#{p.name} is #{p.age}"
puts p.nickname
p.nickname = "Al"
puts p.nickname
