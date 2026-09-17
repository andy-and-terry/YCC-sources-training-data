function! SubsetSum(nums, target)
  let dp = repeat([0], a:target + 1)
  let dp[0] = 1
  for num in a:nums
    let i = a:target
    while i >= num
      if dp[i - num]
        let dp[i] = 1
      endif
      let i -= 1
    endwhile
  endfor
  return dp[a:target] == 1
endfunction

echo SubsetSum([3, 34, 4, 12, 5, 2], 9)
echo SubsetSum([3, 34, 4, 12, 5, 2], 30)
