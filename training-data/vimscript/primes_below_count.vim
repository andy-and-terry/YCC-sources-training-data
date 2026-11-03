function! CountPrimesBelow(n) abort
  if a:n < 3
    return 0
  endif
  let l:composite = repeat([0], a:n)
  let l:count = 0
  for l:i in range(2, a:n - 1)
    if l:composite[l:i]
      continue
    endif
    let l:count += 1
    for l:j in range(l:i * l:i, a:n - 1, l:i)
      let l:composite[l:j] = 1
    endfor
  endfor
  return l:count
endfunction

echo CountPrimesBelow(100)
