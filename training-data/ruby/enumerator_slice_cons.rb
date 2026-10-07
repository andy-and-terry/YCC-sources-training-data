numbers = (1..10).to_a

puts numbers.each_slice(3).map(&:sum).inspect
puts numbers.each_cons(4).first(2).inspect

diffs = numbers.map { |n| n * n }.each_cons(2).map { |a, b| b - a }
puts diffs.inspect

moving_avg = [4, 8, 6, 2, 10].each_cons(3).map { |w| (w.sum / w.size.to_f).round(2) }
puts moving_avg.inspect

puts %w[a b c d e].each_with_index.map { |ch, i| "#{i}:#{ch}" }.join(" ")
puts %w[x y z].each.with_index(1).to_a.inspect

evens, odds = numbers.partition(&:even?)
puts evens.inspect, odds.inspect

puts numbers.chunk_while { |a, b| b == a + 1 }.to_a.length
puts [1, 2, 4, 9, 10, 11, 12, 15].slice_when { |i, j| i + 1 != j }.to_a.inspect
