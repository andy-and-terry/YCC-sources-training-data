words = %w[a b a c b a]
counts = words.each_with_object(Hash.new(0)) { |w, h| h[w] += 1 }
p counts
p words.tally.sort_by { |_, v| -v }
p words.group_by(&:itself).transform_values(&:size)
