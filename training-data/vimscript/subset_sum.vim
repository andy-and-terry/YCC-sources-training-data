function! SubsetSum(nums, target)
  let n = len(a:nums)
  let dp = []
  for i in range(n + 1)
    call add(dp, repeat([0], a:target + 1))
    let dp[i][0] = 1
  endfor

  for i in range(1, n)
    for t in range(1, a:target)
      let dp[i][t] = dp[i - 1][t]
      if a:nums[i - 1] <= t && dp[i - 1][t - a:nums[i - 1]]
        let dp[i][t] = 1
      endif
    endfor
  endfor

  return dp[n][a:target] == 1
endfunction

echo SubsetSum([3, 34, 4, 12, 5, 2], 9)
echo SubsetSum([3, 34, 4, 12, 5, 2], 10)
