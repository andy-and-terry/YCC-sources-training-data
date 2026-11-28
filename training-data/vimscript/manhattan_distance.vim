function! Manhattan(a, b) abort
  let l:s = 0
  for l:i in range(len(a:a))
    let l:s += abs(a:a[l:i] - a:b[l:i])
  endfor
  return l:s
endfunction

echo Manhattan([1, 2], [4, 6])
