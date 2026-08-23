def find_missing(arr : Array(Int32), n : Int32) : Int32
  expected_sum = n * (n + 1) // 2
  actual_sum = arr.sum
  expected_sum - actual_sum
end

puts find_missing([1, 2, 4, 5, 6], 6)
