def describe(value : Int32 | String | Array(Int32) | Nil) : String
  case value
  when Int32        then "int #{value}"
  when String       then "string of #{value.size} chars"
  when Array(Int32) then "array summing to #{value.sum}"
  else                   "nil"
  end
end

values = [1, "abc", [1, 2, 3], nil] of Int32 | String | Array(Int32) | Nil
values.each { |v| puts describe(v) }

x = rand < 2.0 ? 5 : "five"
typeof(x).to_s.tap { |t| puts t }

if x.is_a?(Int32)
  puts x + 1
end
puts x.class
