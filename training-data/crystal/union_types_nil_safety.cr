def describe(x : Int32 | String | Nil) : String
  case x
  when Int32  then "int #{x + 1}"
  when String then "string #{x.upcase}"
  when Nil    then "nil"
  else             "?"
  end
end

puts describe(1), describe("a"), describe(nil)
val : Int32? = nil
puts val.try { |v| v * 2 }.inspect
val = 21
puts val.try(&.*(2))
name = ENV["NO_SUCH_VAR"]?
puts name || "default"
puts (name || "x").size
if (v = val) && v > 20
  puts "big #{v}"
end
arr = [1, nil, 3]
puts arr.compact.sum
puts arr.map { |e| e || 0 }.inspect
puts typeof(arr), typeof(val)
