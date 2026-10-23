a = "hello"
b = "hello"
c = a

puts a == b
puts a.equal?(b)
puts a.equal?(c)
puts a.object_id == c.object_id

puts :sym.object_id == :sym.object_id
puts 42.object_id == 42.object_id
puts nil.object_id

def mutate(s)
  s << " world"
end

mutate(a)
puts c
puts b

d = a.dup
d << "!"
puts a
puts d
