def describe(value : Int32 | String | Nil | Array(Int32)) : String
  case value
  when Int32
    "integer #{value}"
  when String
    "string of length #{value.size}"
  when Nil
    "nothing"
  when Array
    "array with #{value.size} items"
  else
    "unreachable"
  end
end

puts describe(42)
puts describe("hello")
puts describe(nil)
puts describe([1, 2, 3])

mixed = [1, "two", nil, 4]
puts typeof(mixed)
mixed.each { |m| puts m.is_a?(Int32) ? "int" : "other" }
