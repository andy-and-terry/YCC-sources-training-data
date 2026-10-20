def each_pair(a, b, &)
  a.each_with_index { |x, i| yield x, b[i] }
end
each_pair([1, 2], ["a", "b"]) { |x, y| puts "#{x}#{y}" }

square = ->(x : Int32) { x * x }
add = ->(a : Int32, b : Int32) { a + b }
puts square.call(7), add.call(1, 2), [1, 2, 3].map(&square).inspect
compose = ->(f : Int32 -> Int32, g : Int32 -> Int32) { ->(x : Int32) { f.call(g.call(x)) } }
puts compose.call(square, ->(x : Int32) { x + 1 }).call(4)

def counter
  n = 0
  -> { n += 1 }
end
c = counter
c.call; c.call
puts c.call

iter = (1..Int32::MAX).each
puts iter.first(3).inspect
puts (1..20).step(5).to_a.inspect, (1..Float64::INFINITY).each.select(&.even?).first(3).inspect rescue puts "skip"
puts (1..10).each_slice(3).map(&.sum).to_a.inspect
fib = Iterator.of { a = 0; b = 1; ->{ r = a; a, b = b, a + b; r } }.call rescue nil
gen = Iterator.of(1).map { |x| x * 2 }.first(3)
puts gen.inspect
puts [1, 2, 3].each_cons(2).to_a.inspect, [3, 1, 2].sort { |a, b| b <=> a }.inspect
