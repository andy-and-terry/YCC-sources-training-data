function! Kadane(items)
  let best = a:items[0]
  let current = a:items[0]
  for i in range(1, len(a:items) - 1)
    let current = max([a:items[i], current + a:items[i]])
    let best = max([best, current])
  endfor
  return best
endfunction

echo Kadane([-2, 1, -3, 4, -1, 2, 1, -5, 4])
