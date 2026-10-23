# Ranges: step, %, endless/beginless, and lazy use.
p (1..10).step(3).to_a
p (1.0..2.0).step(0.5).to_a
p ((1..10) % 4).to_a             # Range#% is an alias for step

# Endless range with a lazy chain
evens = (1..).lazy.select(&:even?).map { |n| n * n }
p evens.first(4)

# Beginless ranges work in comparisons and slicing.
r = (..10)
p r.include?(3), r.include?(11)
arr = %w[a b c d e f]
p arr[..2], arr[3..], arr[-2..]

# case/when with ranges
def bucket(n)
  case n
  when ...0 then :negative
  when 0 then :zero
  when 1..9 then :small
  else :large
  end
end
p [-5, 0, 7, 100].map { |n| bucket(n) }

# Exclusive end and string ranges
p ("a"..."e").to_a
p (1...10).size, (1..10).sum
p 1.step(10, 4).to_a
p 10.step(1, -3).to_a
