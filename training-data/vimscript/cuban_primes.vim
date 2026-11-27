function! IsPrime(n) abort
  if a:n < 2 | return 0 | endif
  let i = 2
  while i * i <= a:n
    if a:n % i == 0 | return 0 | endif
    let i += 1
  endwhile
  return 1
endfunction

let out = []
let y = 1
while len(out) < 8
  let p = 3 * y * y + 3 * y + 1
  if IsPrime(p) | call add(out, p) | endif
  let y += 1
endwhile
echo join(out, ' ')
