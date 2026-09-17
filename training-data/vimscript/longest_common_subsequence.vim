function! Lcs(a, b)
  let m = len(a:a)
  let n = len(a:b)
  let dp = []
  for i in range(0, m)
    call add(dp, repeat([0], n + 1))
  endfor

  for i in range(1, m)
    for j in range(1, n)
      if a:a[i - 1] ==# a:b[j - 1]
        let dp[i][j] = dp[i - 1][j - 1] + 1
      else
        let dp[i][j] = max([dp[i - 1][j], dp[i][j - 1]])
      endif
    endfor
  endfor

  return dp[m][n]
endfunction

echo Lcs('ABCBDAB', 'BDCABA')
