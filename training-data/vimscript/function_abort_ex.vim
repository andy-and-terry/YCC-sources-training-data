function! s:Sum(...) abort
  let total = 0
  for n in a:000
    let total += n
  endfor
  return total
endfunction
echo s:Sum(1, 2, 3)
