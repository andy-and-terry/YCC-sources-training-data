def pancake_sort(items)
  a = items.dup
  flips = []
  a.size.downto(2) do |size|
    max_idx = (0...size).max_by { |i| a[i] }
    next if max_idx == size - 1

    if max_idx.positive?
      a[0..max_idx] = a[0..max_idx].reverse
      flips << max_idx + 1
    end
    a[0...size] = a[0...size].reverse
    flips << size
  end
  [a, flips]
end

sorted, flips = pancake_sort([23, 10, 20, 11, 12, 6, 7])
puts "#{sorted.inspect} flips=#{flips.inspect}"
