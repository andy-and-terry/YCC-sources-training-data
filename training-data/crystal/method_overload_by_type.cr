# Overloading by argument type and by arity.
def area(r : Float64)
  Math::PI * r * r
end

def area(w : Int32, h : Int32)
  w * h
end

def area(side : Int32)
  side * side
end

def show(x : Int32)
  "Int32"
end

def show(x : String)
  "String"
end

def show(x : Number)
  "Number"
end

puts area(2.0).round(2)
puts area(3, 4)
puts area(5)
puts show(1)
puts show("a")
puts show(1.5)
