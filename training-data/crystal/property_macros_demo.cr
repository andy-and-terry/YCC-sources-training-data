class Person
  property name : String
  getter age : Int32
  setter nickname : String?
  getter? active : Bool = true

  def initialize(@name : String, @age : Int32)
  end

  def birthday!
    @age += 1
  end

  def nickname
    @nickname || @name
  end
end

p1 = Person.new("Alice", 30)
p1.name = "Alicia"
p1.birthday!
puts "#{p1.name} is #{p1.age}"
puts p1.nickname
p1.nickname = "Ali"
puts p1.nickname
puts p1.active?
