prices = {"apple" => 1.2, "pear" => 0.8, "fig" => 3.0}

puts prices.transform_values { |v| (v * 100).round.to_i }
puts prices.transform_keys(&.upcase)
puts prices.select { |_, v| v > 1.0 }
puts prices.reject { |k, _| k.size > 3 }
puts prices.min_by { |_, v| v }
puts prices.to_a.sort_by { |_, v| -v }.map(&.first)
puts prices.merge({"kiwi" => 2.0}) { |_, a, b| a + b }
puts prices.fetch("plum", 0.0)
puts prices.key_for?(3.0).inspect
puts prices.sum { |_, v| v }.round(2)
