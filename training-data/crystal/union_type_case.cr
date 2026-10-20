def describe(x : Int32 | String | Nil)
  case x
  when Int32  then "int #{x + 1}"
  when String then "str #{x.upcase}"
  else             "nil"
  end
end
puts describe(1), describe("a"), describe(nil)
