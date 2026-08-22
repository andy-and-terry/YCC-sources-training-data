text = 'the quick brown fox jumps over the lazy dog the fox runs'
counts = text.downcase.split.tally
counts.sort_by { |_, c| -c }.first(3).each { |word, c| puts "#{word}: #{c}" }
