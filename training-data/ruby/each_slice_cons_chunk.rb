a = (1..10).to_a
p a.each_slice(3).to_a
p a.each_cons(4).first(2)
p a.chunk_while { |x, y| y == x + 1 }.to_a.length
