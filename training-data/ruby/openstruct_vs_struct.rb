require "ostruct"

Point = Struct.new(:x, :y) do
  def distance_to(other)
    Math.sqrt((x - other.x)**2 + (y - other.y)**2)
  end
end

a = Point.new(0, 0)
b = Point.new(3, 4)
puts a.distance_to(b)
puts b.to_a.inspect
puts b.to_h.inspect
puts a == Point.new(0, 0)

x, y = *b
puts "x=#{x} y=#{y}"

person = OpenStruct.new(name: "Ada", age: 36)
person.email = "ada@example.com"
person[:age] += 1
puts person.name, person.age, person.email
puts person.respond_to?(:email)
puts person.missing.inspect
person.delete_field(:email)
puts person.to_h.inspect
puts person.dig(:name)
