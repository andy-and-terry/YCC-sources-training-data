function! HofstadterQ(count)
  " q[0] is a placeholder so indices match the 1-based definition
  let q = [0, 1, 1]
  for n in range(3, a:count)
    call add(q, q[n - q[n - 1]] + q[n - q[n - 2]])
  endfor
  return q[1 : a:count]
endfunction

echo join(HofstadterQ(20), ' ')
