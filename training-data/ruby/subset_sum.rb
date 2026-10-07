def subset_sum?(numbers, target)
  table = Array.new(numbers.size + 1) { Array.new(target + 1, false) }
  table.each { |row| row[0] = true }

  (1..numbers.size).each do |i|
    (1..target).each do |t|
      table[i][t] = if numbers[i - 1] > t
                       table[i - 1][t]
                     else
                       table[i - 1][t] || table[i - 1][t - numbers[i - 1]]
                     end
    end
  end

  table[numbers.size][target]
end

puts subset_sum?([3, 34, 4, 12, 5, 2], 9)
puts subset_sum?([3, 34, 4, 12, 5, 2], 10)
puts subset_sum?([1, 2, 3], 7)
