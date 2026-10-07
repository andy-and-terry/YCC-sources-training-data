function! MatrixChainOrder(dims)
  let n = len(a:dims) - 1
  let dp = []
  for i in range(n)
    call add(dp, repeat([0], n))
  endfor

  for len_ in range(2, n)
    for i in range(0, n - len_)
      let j = i + len_ - 1
      let dp[i][j] = 999999
      for k in range(i, j - 1)
        let cost = dp[i][k] + dp[k + 1][j] + a:dims[i] * a:dims[k + 1] * a:dims[j + 1]
        if cost < dp[i][j]
          let dp[i][j] = cost
        endif
      endfor
    endfor
  endfor

  return dp[0][n - 1]
endfunction

echo MatrixChainOrder([10, 20, 30, 40, 30])
