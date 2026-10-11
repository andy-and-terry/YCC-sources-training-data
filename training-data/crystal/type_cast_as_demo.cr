value : Int32 | String | Nil = "42"

if value.is_a?(String)
  puts value.to_i + 1
end

puts value.as(String).size
puts value.as?(Int32).inspect

data = [1, "a", 2.5] of Int32 | String | Float64
ints = data.select(Int32)
puts ints.inspect

begin
  value.as(Int32)
rescue ex : TypeCastError
  puts "cast failed"
end

puts value.try(&.upcase)
puts value.not_nil!
