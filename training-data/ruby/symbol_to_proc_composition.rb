puts %w[a b c].map(&:upcase).inspect
puts [1, 2, 3].inject(:+), [[1, 2], [3]].sum([]).inspect
add1 = 1.method(:+)
dbl = ->(x) { x * 2 }
puts (add1 >> dbl).call(4), (add1 << dbl).call(4)
puts %w[apple fig kiwi].sort_by { |w| [-w.size, w] }.inspect
