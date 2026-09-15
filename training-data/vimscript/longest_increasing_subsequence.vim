function! LongestIncreasingSubsequence(nums)
  let n = len(a:nums)
  if n == 0
    return 0
  endif
  let dp = repeat([1], n)
  let i = 1
  while i < n
    let j = 0
    while j < i
      if a:nums[j] < a:nums[i] && dp[j] + 1 > dp[i]
        let dp[i] = dp[j] + 1
      endif
      let j += 1
    endwhile
    let i += 1
  endwhile
  return max(dp)
endfunction

echo LongestIncreasingSubsequence([10, 9, 2, 5, 3, 7, 101, 18])
echo LongestIncreasingSubsequence([0, 1, 0, 3, 2, 3])
