# Range features: step, endless/beginless ranges, cover? and slicing.
p (1..10).step(3).to_a
p 1.step(10, 4).to_a
p (0.0..1.0).step(0.25).to_a
p ("a".."e").to_a

p (1..).lazy.map { |n| n * n }.select(&:even?).first(3)

arr = %w[a b c d e f]
p arr[2..]
p arr[..2]
p arr[1...-1]

p (1..10).cover?(3..5)
p ("a".."z").cover?("mm")
p ("a".."z").include?("mm")

grade = ->(s) do
  case s
  when 90.. then "A"
  when 80...90 then "B"
  when ...80 then "C"
  end
end
p [95, 85, 40].map(&grade)
p (1...10).size, (1..10).sum, (5..1).to_a
