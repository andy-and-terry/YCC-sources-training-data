# Crystal overloads methods on argument types and arity.
def describe(x : Int32)
  "int #{x}"
end

def describe(x : String)
  "string '#{x}'"
end

def describe(x : Array(Int32))
  "array of #{x.size} ints"
end

def describe(x : Int32, y : Int32)
  "pair #{x},#{y}"
end

def describe(x : Nil)
  "nothing"
end

puts describe(5)
puts describe("hi")
puts describe([1, 2, 3])
puts describe(1, 2)
puts describe(nil)
