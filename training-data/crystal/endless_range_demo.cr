nums = (1..).each.first(5)
puts nums.inspect

puts (1..).each.select(&.even?).first(3).inspect

arr = [10, 20, 30, 40, 50]
puts arr[2..].inspect
puts arr[..1].inspect
puts arr[1...-1].inspect

r = 1...10
puts r.includes?(10)
puts r.size
puts (1..10).step(3).to_a.inspect
puts (10).downto(7).to_a.inspect
puts ('a'..'e').each_cons(2).map(&.join).to_a.inspect
puts (1.0..2.0).includes?(1.5)
