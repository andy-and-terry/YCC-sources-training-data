h = { a: 1, b: nil, c: 3, d: 4 }
puts h.compact.inspect
puts h.select { |_, v| v&.odd? }.inspect
puts h.reject { |_, v| v.nil? }.inspect
puts h.filter_map { |k, v| k if v && v > 2 }.inspect
puts h.slice(:a, :c).inspect, h.except(:a, :b).inspect
puts h.min_by { |_, v| v || 99 }.inspect
puts h.sum { |_, v| v.to_i }
puts h.count { |_, v| v.nil? }
puts h.find { |_, v| v == 3 }.inspect
puts h.sort_by { |k, v| [-v.to_i, k] }.to_h.inspect
puts h.each_with_object({}) { |(k, v), acc| acc[v] = k if v }.inspect
puts h.any? { |_, v| v.nil? }, h.all? { |_, v| v.nil? || v > 0 }
puts h.partition { |_, v| v.to_i.even? }.map(&:to_h).inspect
puts h.to_a.transpose.inspect
puts h.invert.inspect
