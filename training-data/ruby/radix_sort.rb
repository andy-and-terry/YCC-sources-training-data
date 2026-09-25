def radix_sort(array)
  return array if array.empty?

  max_digits = array.max.to_s.size

  max_digits.times do |digit|
    buckets = Array.new(10) { [] }
    array.each do |n|
      digit_value = (n / (10**digit)) % 10
      buckets[digit_value] << n
    end
    array = buckets.flatten
  end

  array
end

puts radix_sort([170, 45, 75, 90, 802, 24, 2, 66]).inspect
puts radix_sort([9, 8, 7, 1]).inspect
