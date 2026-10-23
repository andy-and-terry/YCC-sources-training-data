words = %w[apple avocado banana blueberry cherry apricot]

by_letter = words.group_by { |w| w[0] }
p by_letter
p by_letter.transform_values(&:size)

p words.minmax_by(&:length)
p words.min_by(2, &:length)
p words.max(2)
p words.sum(&:length)
p words.sum("") { |w| w[0] }
p (1..10).partition(&:even?)
p words.flat_map { |w| w.chars.first(2) }.tally.max_by { |_, c| c }
