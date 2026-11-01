def describe(x : Int32 | String | Nil)
  case x
  when Int32  then "int #{x}"
  when String then "string #{x.upcase}"
  else             "nil"
  end
end

puts describe(5)
puts describe("hi")
puts describe(nil)
