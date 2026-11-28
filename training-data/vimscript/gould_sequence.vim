function! Popcount(n) abort
  let n = a:n
  let c = 0
  while n > 0
    let c += and(n, 1)
    let n = n / 2
  endwhile
  return c
endfunction

echo join(map(range(16), 'float2nr(pow(2, Popcount(v:val)))'), ' ')
