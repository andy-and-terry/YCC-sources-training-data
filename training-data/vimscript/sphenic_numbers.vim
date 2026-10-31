function! IsSphenic(n)
  let n = a:n
  let distinct = 0
  let p = 2
  while p * p <= n
    if n % p == 0
      let n = n / p
      if n % p == 0
        return 0
      endif
      let distinct += 1
    endif
    let p += 1
  endwhile
  return distinct + (n > 1 ? 1 : 0) == 3
endfunction

echo filter(range(2, 79), 'IsSphenic(v:val)')
