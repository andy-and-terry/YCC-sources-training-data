def cosine(a, b)
  dot = a.zip(b).sum { |x, y| x * y }
  na = Math.sqrt(a.sum { |x| x * x })
  nb = Math.sqrt(b.sum { |x| x * x })
  na.zero? || nb.zero? ? 0.0 : dot / (na * nb)
end

puts cosine([1, 2, 3], [4, 5, 6]).round(4)
