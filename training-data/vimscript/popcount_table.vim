" Population count (number of set bits) for 0..15
function! Bits(n) abort
  let l:n = a:n
  let l:c = 0
  while l:n > 0
    let l:c += and(l:n, 1)
    let l:n = l:n / 2
  endwhile
  return l:c
endfunction

echo join(map(range(16), 'Bits(v:val)'), ' ')
