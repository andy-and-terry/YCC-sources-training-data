function! MinCoins(coins, amount)
  let dp = repeat([-1], a:amount + 1)
  let dp[0] = 0
  for n in range(1, a:amount)
    for c in a:coins
      if c <= n && dp[n - c] != -1
        if dp[n] == -1 || dp[n - c] + 1 < dp[n]
          let dp[n] = dp[n - c] + 1
        endif
      endif
    endfor
  endfor
  return dp[a:amount]
endfunction

echo MinCoins([1, 2, 5], 11)
