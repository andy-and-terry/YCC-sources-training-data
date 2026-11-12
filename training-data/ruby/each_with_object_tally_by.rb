words = %w[apple avocado banana blueberry cherry]
by = words.each_with_object(Hash.new { |h, k| h[k] = [] }) { |w, h| h[w[0]] << w }
p by
p words.map(&:size).tally
p words.partition { _1.size > 6 }
