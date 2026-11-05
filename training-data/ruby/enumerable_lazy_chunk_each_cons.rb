puts (1..Float::INFINITY).lazy.select(&:even?).map { |x| x * x }.first(4).inspect
p [1, 2, 4, 9, 10, 11].chunk_while { |a, b| b == a + 1 }.to_a
p (1..5).each_cons(2).to_a
p %w[a b c].each_with_index.to_h
