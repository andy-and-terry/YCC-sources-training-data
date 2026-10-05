def describe(value : Int32 | String | Nil | Array(Int32)) : String
  case value
  when Int32
    "integer #{value + 1}"
  when String
    "string of size #{value.size}"
  when Nil
    "nothing"
  when Array
    "array sum #{value.sum}"
  else
    "unreachable"
  end
end

items = [42, "crystal", nil, [1, 2, 3]] of Int32 | String | Nil | Array(Int32)
items.each { |item| puts describe(item) }

x = rand < 2 ? "text" : 5
if x.is_a?(String)
  puts x.upcase
end
puts typeof(x)
