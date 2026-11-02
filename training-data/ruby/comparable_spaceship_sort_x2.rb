words = %w[pear fig banana kiwi]
p words.sort_by { |w| [-w.size, w] }
p words.max_by(&:length)
