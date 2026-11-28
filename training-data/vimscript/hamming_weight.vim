function! Popcount(n) abort
  let l:n = a:n
  let l:c = 0
  while l:n != 0
    let l:n = and(l:n, l:n - 1)
    let l:c += 1
  endwhile
  return l:c
endfunction

echo Popcount(0xB7) Popcount(255)
