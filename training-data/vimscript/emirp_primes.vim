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
for p in range(2, 99)
  let r = str2nr(join(reverse(split(string(p), '\zs')), ''))
  if r != p && IsPrime(p) && IsPrime(r)
    call add(out, p)
  endif
endfor
echo join(out, ' ')
