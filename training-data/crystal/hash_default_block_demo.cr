# Hash with a default block: group and count without key checks.
words = %w[apple avocado banana blueberry cherry apricot]

groups = Hash(Char, Array(String)).new { |h, k| h[k] = [] of String }
words.each { |w| groups[w[0]] << w }
groups.each { |letter, list| puts "#{letter}: #{list.join(", ")}" }

counts = Hash(Char, Int32).new(0)
words.each { |w| counts[w[0]] += 1 }
p counts
