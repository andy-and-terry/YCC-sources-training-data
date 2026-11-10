function! IsPrime(n) abort
  if a:n < 2 | return 0 | endif
  let i = 2
  while i * i <= a:n
    if a:n % i == 0 | return 0 | endif
    let i += 1
  endwhile
  return 1
endfunction

let pairs = []
for p in range(3, 78)
  if IsPrime(p) && IsPrime(p + 2) | call add(pairs, '(' . p . ',' . (p + 2) . ')') | endif
endfor
echo join(pairs, ' ')
" Expected output: (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
