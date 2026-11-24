" Moebius function: 0 if n has a squared prime factor, else (-1)^k.
function! Mobius(n)
  let l:n = a:n
  let l:result = 1
  let l:p = 2
  while l:p * l:p <= l:n
    if l:n % l:p == 0
      let l:n = l:n / l:p
      if l:n % l:p == 0
        return 0
      endif
      let l:result = -l:result
    endif
    let l:p += 1
  endwhile
  return l:n > 1 ? -l:result : l:result
endfunction

echo join(map(range(1, 30), 'Mobius(v:val)'), ' ')
