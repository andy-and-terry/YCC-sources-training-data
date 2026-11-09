words = %w[pear fig banana kiwi]
p words.sort_by { |w| [w.size, w] }
p words.max_by(&:size), words.min_by(&:size)
p words.sort { |a, b| b <=> a }
