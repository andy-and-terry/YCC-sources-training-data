# Enumerable helpers for counting and grouping.
words = %w[apple banana apple cherry banana apple]
puts words.tally.inspect
puts words.group_by(&:size).inspect
puts words.each_with_object(Hash.new(0)) { |w, h| h[w[0]] += 1 }.inspect
puts words.each_slice(4).to_a.inspect
puts words.each_cons(2).count { |a, b| a == b }
puts words.uniq.partition { |w| w.size > 5 }.inspect
puts (1..10).each_with_index.select { |n, i| i.even? }.map(&:first).inspect
