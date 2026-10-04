counts = Hash.new(0)
"the quick the lazy the end".split.each { |w| counts[w] += 1 }
p counts

nested = Hash.new { |h, k| h[k] = [] }
%w[apple avocado banana].each { |w| nested[w[0]] << w }
p nested

prices = { apple: 1.5, pear: 2.0, fig: 4.0 }
p prices.transform_values { |v| (v * 100).to_i }
p prices.transform_keys(&:to_s)
p prices.select { |_, v| v > 1.8 }
p prices.min_by { |_, v| v }
p prices.sum { |_, v| v }
p prices.group_by { |_, v| v > 1.8 ? :pricey : :cheap }
p prices.to_a.transpose
p prices.filter_map { |k, v| k if v < 3 }
