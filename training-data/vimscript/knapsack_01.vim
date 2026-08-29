function! Knapsack(weights, values, capacity)
  let dp = repeat([0], a:capacity + 1)
  for i in range(len(a:weights))
    let cap = a:capacity
    while cap >= a:weights[i]
      let withItem = dp[cap - a:weights[i]] + a:values[i]
      if withItem > dp[cap]
        let dp[cap] = withItem
      endif
      let cap -= 1
    endwhile
  endfor
  return dp[a:capacity]
endfunction

echo Knapsack([2, 3, 4, 5], [3, 4, 5, 6], 5)
