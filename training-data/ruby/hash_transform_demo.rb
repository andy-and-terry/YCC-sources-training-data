prices = { apple: 1.2, pear: 0.8, kiwi: 2.5 }

puts prices.transform_values { |v| (v * 100).to_i }.inspect
puts prices.transform_keys(&:to_s).inspect
puts prices.transform_keys(apple: :malus).inspect
puts prices.filter_map { |k, v| k if v > 1 }.inspect
puts prices.select { |_, v| v < 2 }.inspect
puts prices.reject { |_, v| v < 2 }.inspect
puts prices.min_by { |_, v| v }.inspect
puts prices.sum { |_, v| v }.round(2)
puts prices.sort_by { |_, v| -v }.to_h.inspect
puts prices.to_a.transpose.inspect
puts prices.invert.inspect
puts prices.group_by { |_, v| v > 1 ? :expensive : :cheap }.transform_values { |prs| prs.map(&:first) }.inspect

defaults = { color: "red", size: :m }
puts defaults.merge({ size: :l, extra: 1 }) { |_k, old, new| new }.inspect
puts defaults.slice(:color).inspect, defaults.except(:color).inspect
puts defaults.any? { |_, v| v == :m }, defaults.count, defaults.key(:m).inspect
puts defaults.each_with_object({}) { |(k, v), h| h[v] = k }.inspect
