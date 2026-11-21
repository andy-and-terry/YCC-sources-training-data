" Carmichael numbers via Korselt's criterion: n is squarefree, composite,
" and p - 1 divides n - 1 for every prime factor p.
function! IsCarmichael(n)
  let l:m = a:n
  let l:p = 2
  let l:count = 0
  while l:p * l:p <= l:m
    if l:m % l:p == 0
      let l:m = l:m / l:p
      if l:m % l:p == 0
        return 0
      endif
      if (a:n - 1) % (l:p - 1) != 0
        return 0
      endif
      let l:count += 1
    endif
    let l:p += 1
  endwhile
  if l:m > 1
    if (a:n - 1) % (l:m - 1) != 0
      return 0
    endif
    let l:count += 1
  endif
  return l:count >= 2
endfunction

echo join(filter(range(3, 2999, 2), 'IsCarmichael(v:val)'), ' ')
