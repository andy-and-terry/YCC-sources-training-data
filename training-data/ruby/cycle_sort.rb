# Sorts in place with the minimum number of writes; returns the write count.
def cycle_sort!(a)
  writes = 0
  position = ->(item, start) { start + a[(start + 1)..].count { |x| x < item } }
  (0...(a.size - 1)).each do |start|
    item = a[start]
    pos = position.call(item, start)
    next if pos == start

    pos += 1 while item == a[pos]
    a[pos], item = item, a[pos]
    writes += 1
    while pos != start
      pos = position.call(item, start)
      pos += 1 while item == a[pos]
      a[pos], item = item, a[pos]
      writes += 1
    end
  end
  writes
end

data = [1, 8, 3, 9, 10, 10, 2, 4]
w = cycle_sort!(data)
puts "#{data.inspect} writes=#{w}"
