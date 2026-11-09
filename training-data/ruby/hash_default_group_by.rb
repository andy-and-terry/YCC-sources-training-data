counts = Hash.new(0)
%w[a b a c a].each { |w| counts[w] += 1 }
p counts
p %w[apple avocado banana].group_by { |w| w[0] }
p counts.sort_by { |k, v| [-v, k] }.to_h
p counts.transform_values { |v| v * 10 }
