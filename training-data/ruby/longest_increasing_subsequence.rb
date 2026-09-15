def longest_increasing_subsequence(nums)
  return 0 if nums.empty?

  tails = []

  nums.each do |num|
    idx = tails.bsearch_index { |t| t >= num }
    if idx
      tails[idx] = num
    else
      tails << num
    end
  end

  tails.length
end

puts longest_increasing_subsequence([10, 9, 2, 5, 3, 7, 101, 18])
puts longest_increasing_subsequence([0, 1, 0, 3, 2, 3])
puts longest_increasing_subsequence([7, 7, 7, 7])
