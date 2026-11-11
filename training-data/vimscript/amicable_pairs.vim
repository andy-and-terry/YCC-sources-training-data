" Amicable pairs: d(a) == b and d(b) == a with a != b.
function! D(n) abort
  let l:s = 0
  for l:i in range(1, a:n - 1)
    if a:n % l:i == 0
      let l:s += l:i
    endif
  endfor
  return l:s
endfunction

for s:a in range(2, 1499)
  let s:b = D(s:a)
  if s:b > s:a && D(s:b) == s:a
    echo s:a s:b
  endif
endfor
