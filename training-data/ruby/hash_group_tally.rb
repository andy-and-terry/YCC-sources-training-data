words = %w[apple avocado banana blueberry cherry apple]

puts words.tally.inspect
puts words.group_by { |w| w[0] }.inspect
puts words.group_by(&:size).transform_values(&:count).inspect
puts words.uniq.partition { |w| w.size > 5 }.inspect
puts words.tally.sort_by { |w, c| [-c, w] }.first(2).inspect
puts words.each_with_index.group_by { |w, _| w }.transform_values { |v| v.map(&:last) }.inspect
puts words.tally.select { |_, c| c > 1 }.keys.inspect
puts words.chunk_while { |a, b| a[0] == b[0] }.to_a.inspect
puts words.sum(&:length)
puts words.min_by(&:length), words.max_by(&:length)
