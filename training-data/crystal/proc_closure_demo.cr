def make_adder(n : Int32) : Int32 -> Int32
  ->(x : Int32) { x + n }
end

add5 = make_adder(5)
puts add5.call(10)

compose = ->(f : Int32 -> Int32, g : Int32 -> Int32) { ->(x : Int32) { g.call(f.call(x)) } }
double = ->(x : Int32) { x * 2 }
puts compose.call(add5, double).call(1)

puts [1, 2, 3].map(&add5).inspect
