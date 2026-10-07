def format(value : Int32)
  "int(#{value})"
end

def format(value : String)
  "str(#{value.inspect})"
end

def format(value : Array(T)) forall T
  "[" + value.map { |v| format(v) }.join(", ") + "]"
end

def format(value : Nil)
  "nil"
end

def format(value : Float64, precision : Int32 = 2)
  "float(#{value.round(precision)})"
end

puts format(10)
puts format("hi")
puts format([1, 2, 3])
puts format(["a", "b"])
puts format(nil)
puts format(3.14159)
puts format(3.14159, 4)
