r = (1..10)
puts r.sum, r.to_a.size, r.include?(5), r.cover?(3..4)
puts (1...10).size, ("a".."e").to_a.join
puts r.step(3).to_a.inspect
puts r.select(&:even?).inspect
puts r.each_slice(4).map(&:sum).inspect
puts (1..Float::INFINITY).lazy.map { |x| x * 2 }.first(3).inspect
puts (1..).first(2).inspect
puts (..5).include?(3)
puts r.minmax.inspect, (5..1).to_a.inspect
puts 5.clamp(1..3), 0.clamp(1..3)
case 75
when 90.. then puts "A"
when 70...90 then puts "B"
else puts "C"
end
puts (1.0..2.0).include?(1.5)
