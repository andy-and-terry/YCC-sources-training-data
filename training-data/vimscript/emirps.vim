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
let n = 2
while len(out) < 10
  let r = str2nr(join(reverse(split(string(n), '\zs')), ''))
  if r != n && IsPrime(n) && IsPrime(r) | call add(out, n) | endif
  let n += 1
endwhile
echo join(out, ' ')
" Expected output: 13 17 31 37 71 73 79 97 107 113
