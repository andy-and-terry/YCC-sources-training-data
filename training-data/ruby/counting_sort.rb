def counting_sort(array)
  return array if array.empty?

  max = array.max
  counts = Array.new(max + 1, 0)
  array.each { |n| counts[n] += 1 }

  result = []
  counts.each_with_index do |count, value|
    count.times { result << value }
  end
  result
end

puts counting_sort([4, 2, 2, 8, 3, 3, 1]).inspect
puts counting_sort([5, 0, 0, 3]).inspect
