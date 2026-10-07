# Union types are resolved with is_a?, case/in and responds_to?.
def describe(value : Int32 | String | Nil | Array(Int32))
  case value
  when Int32       then "int #{value}"
  when String      then "string #{value.size} chars"
  when Nil         then "nothing"
  when Array(Int32) then "array of #{value.size}"
  end
end

[1, "hello", nil, [1, 2, 3]].each { |v| puts describe(v) }

x = rand < 2 ? 5 : "five"
if x.is_a?(Int32)
  puts x + 1
else
  puts x.upcase
end
