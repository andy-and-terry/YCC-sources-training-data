function! IsPrime(n) abort
  if a:n < 2 | return 0 | endif
  let i = 2
  while i * i <= a:n
    if a:n % i == 0 | return 0 | endif
    let i += 1
  endwhile
  return 1
endfunction

let found = []
let p = 2
while len(found) < 10
  if IsPrime(p) && IsPrime(2 * p + 1) | call add(found, p) | endif
  let p += 1
endwhile
echo join(found, ' ')
" Expected output: 2 3 5 11 23 29 41 53 83 89
