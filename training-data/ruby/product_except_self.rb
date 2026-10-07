def product_except_self(nums)
  prefix = nums.each_with_object([1]) { |x, acc| acc << acc.last * x }
  suffix = nums.reverse.each_with_object([1]) { |x, acc| acc << acc.last * x }.reverse
  nums.each_index.map { |i| prefix[i] * suffix[i + 1] }
end

p product_except_self([1, 2, 3, 4]), product_except_self([-1, 1, 0, -3, 3])
