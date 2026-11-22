" Practical numbers: every m in 1..n is a sum of distinct divisors of n.
function! IsPractical(n)
  let l:reach = {0: 1}
  for l:d in range(1, a:n)
    if a:n % l:d == 0
      for l:r in keys(l:reach)
        let l:reach[l:r + l:d] = 1
      endfor
    endif
  endfor
  for l:m in range(1, a:n)
    if !has_key(l:reach, l:m)
      return 0
    endif
  endfor
  return 1
endfunction

let s:out = []
for s:n in range(1, 40)
  if IsPractical(s:n)
    call add(s:out, s:n)
  endif
endfor
echo join(s:out, ' ')
