def each_pair_with_index(items)
  items.each_with_index { |x, i| yield x, i }
end

each_pair_with_index(%w[a b c]) { |x, i| puts "#{i}: #{x}" }
