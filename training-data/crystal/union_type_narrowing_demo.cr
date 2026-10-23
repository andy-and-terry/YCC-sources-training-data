def describe(v : Int32 | String | Nil)
  case v
  when Int32  then "int #{v + 1}"
  when String then "string #{v.upcase}"
  else             "nil"
  end
end

puts describe(41)
puts describe("crystal")
puts describe(nil)

x = [1, "two", nil].sample(1).first
if x.is_a?(Int32)
  puts "got an int"
end
