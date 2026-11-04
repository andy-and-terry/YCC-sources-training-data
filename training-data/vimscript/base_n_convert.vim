function! ToBase(n, base) abort
  let digits = '0123456789abcdefghijklmnopqrstuvwxyz'
  if a:n == 0
    return '0'
  endif
  let n = a:n
  let out = ''
  while n > 0
    let out = digits[n % a:base] . out
    let n = n / a:base
  endwhile
  return out
endfunction

for b in [2, 8, 16, 36]
  echo printf('255 in base %d = %s', b, ToBase(255, b))
endfor
echo printf('%x', 255) printf('%o', 255) printf('%b', 10)
