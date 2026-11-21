" Amicable pairs below 1500 via sums of proper divisors.
function! S(n)
  let l:t = 0
  for l:d in range(1, a:n - 1)
    if a:n % l:d == 0
      let l:t += l:d
    endif
  endfor
  return l:t
endfunction

let s:out = []
for s:a in range(2, 1499)
  let s:b = S(s:a)
  if s:b > s:a && S(s:b) == s:a
    call add(s:out, s:a . ' ' . s:b)
  endif
endfor
echo join(s:out, ' / ')
