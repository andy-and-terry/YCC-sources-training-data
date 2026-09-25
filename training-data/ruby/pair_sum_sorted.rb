def pair_with_sum(nums, target)
  i, j = 0, nums.size - 1
  while i < j
    case nums[i] + nums[j] <=> target
    when 0 then return [i, j]
    when -1 then i += 1
    else j -= 1
    end
  end
  nil
end

p pair_with_sum([1, 3, 4, 6, 8, 11], 10)
p pair_with_sum([1, 2, 3], 100)
