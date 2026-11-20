" Manhattan distance.
function! Manhattan(a, b) abort
  let s = 0
  for i in range(len(a:a))
    let s += abs(a:a[i] - a:b[i])
  endfor
  return s
endfunction
echo Manhattan([1, 2], [4, 6])
