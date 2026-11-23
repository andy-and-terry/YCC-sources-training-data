" n(2n^2+1)/3
function! Term(n) abort
  let n = a:n
  return (n * (((2 * n) * n) + 1)) / 3
endfunction

for n in range(1, 15)
  echo printf('%2d -> %d', n, Term(n))
endfor
