a = [4, 9, 5, 4, 4]
b = [9, 4, 9, 8, 4]

p a & b
p a.intersection(b, [4, 9, 1])

counts = a.tally
multi = b.each_with_object([]) do |x, out|
  next unless counts.fetch(x, 0).positive?

  out << x
  counts[x] -= 1
end
p multi
p a | b, a - b
