def counting_sort(arr : Array(Int32)) : Array(Int32)
  return arr.dup if arr.empty?

  max = arr.max
  counts = Array.new(max + 1, 0)
  arr.each { |v| counts[v] += 1 }

  result = [] of Int32
  counts.each_with_index do |count, value|
    count.times { result << value }
  end

  result
end

puts counting_sort([4, 2, 2, 8, 3, 3, 1]).inspect
