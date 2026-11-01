" Consecutive n, n+1 with equal sums of prime factors (with multiplicity).
function! Sopfr(n)
  let l:m = a:n
  let l:total = 0
  let l:p = 2
  while l:p * l:p <= l:m
    while l:m % l:p == 0
      let l:total += l:p
      let l:m = l:m / l:p
    endwhile
    let l:p += 1
  endwhile
  if l:m > 1
    let l:total += l:m
  endif
  return l:total
endfunction

echo join(filter(range(2, 109), 'Sopfr(v:val) == Sopfr(v:val + 1)'), ' ')
