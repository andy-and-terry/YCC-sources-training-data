function! TwoSum(nums, target)
  let seen = {}
  for i in range(len(a:nums))
    let complement = a:target - a:nums[i]
    if has_key(seen, complement)
      return [seen[complement], i]
    endif
    let seen[a:nums[i]] = i
  endfor
  return []
endfunction

echo TwoSum([2, 7, 11, 15], 9)
