puts (1..10).step(3).to_a.inspect
puts 1.step(20, 5).to_a.inspect
puts 10.step(1, -3).to_a.inspect
puts (0.0..1.0).step(0.25).to_a.inspect
puts ("a".."e").to_a.join
puts ("a".."e").step(2).to_a.inspect

r = (1...10)
puts r.size, r.include?(10), r.cover?(9.5)
puts (1..).lazy.select(&:even?).first(4).inspect
puts (..5).include?(3)

puts (1..10) % 4 == ((1..10).step(4))
puts ((1..10) % 4).to_a.inspect

age = 34
category = case age
           when 0..12 then "child"
           when 13..19 then "teen"
           when 20.. then "adult"
           end
puts category

puts (1..5).sum, (1..5).reduce(:*), (1..5).minmax.inspect
puts (1..3).each_entry.to_a.inspect
