def show(x : Int32 | String | Nil)
  case x
  when Int32 then puts "int #{x}"
  when String then puts "str #{x}"
  when Nil then puts "nil"
  end
end
show(1); show("a"); show(nil)
