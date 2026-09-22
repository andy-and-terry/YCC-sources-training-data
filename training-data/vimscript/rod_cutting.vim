" Rod cutting: maximum revenue from cutting a rod of length n given price[i] for length i.
function! RodCutting(prices, n)
  let dp = repeat([0], a:n + 1)
  for length in range(1, a:n)
    let best = -1
    for cut in range(1, length)
      let candidate = a:prices[cut - 1] + dp[length - cut]
      if candidate > best
        let best = candidate
      endif
    endfor
    let dp[length] = best
  endfor
  return dp[a:n]
endfunction

let prices = [1, 5, 8, 9, 10, 17, 17, 20]
echo RodCutting(prices, 8)
echo RodCutting(prices, 4)
