def describe(x : Int32 | String | Nil)
  case x
  when Int32  then "int #{x}"
  when String then "string #{x}"
  else             "nil"
  end
end

puts describe(1)
puts describe("hi")
puts describe(nil)
