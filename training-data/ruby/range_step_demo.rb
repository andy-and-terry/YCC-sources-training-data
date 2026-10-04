p (1..10).step(3).to_a
p 1.step(10, 4).to_a
p 10.downto(7).to_a
p (1...5).size
p ('a'..'e').to_a
p (1..Float::INFINITY).lazy.select(&:even?).first(3)
p (1..10).each_slice(4).to_a
p (0.0..1.0).step(0.25).to_a

grade = ->(s) do
  case s
  when 90.. then "A"
  when 80...90 then "B"
  when ...80 then "C"
  end
end
p [95, 85, 40].map(&grade)

p (1..5).cover?(3.5)
p (1..5).include?(3.5)
p (1..10) === 5
p (1..5).reduce(:*)
