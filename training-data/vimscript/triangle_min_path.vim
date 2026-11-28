function! MinimumTotal(t) abort
  let dp = copy(a:t[-1])
  for r in range(len(a:t) - 2, 0, -1)
    for i in range(len(a:t[r]))
      let dp[i] = a:t[r][i] + min([dp[i], dp[i + 1]])
    endfor
  endfor
  return dp[0]
endfunction

echo MinimumTotal([[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]])  " 11
