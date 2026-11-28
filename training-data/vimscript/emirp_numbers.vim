function! IsPrime(n) abort
  if a:n < 2 | return 0 | endif
  let l:i = 2
  while l:i * l:i <= a:n
    if a:n % l:i == 0 | return 0 | endif
    let l:i += 1
  endwhile
  return 1
endfunction

function! Rev(n) abort
  return str2nr(join(reverse(split(string(a:n), '\zs')), ''))
endfunction

let s:out = []
for s:p in range(2, 199)
  let s:r = Rev(s:p)
  if s:r != s:p && IsPrime(s:p) && IsPrime(s:r) | call add(s:out, s:p) | endif
endfor
echo join(s:out, ' ') " 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199
