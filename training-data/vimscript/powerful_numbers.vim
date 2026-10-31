function! IsPowerful(n)
  let n = a:n
  let p = 2
  while p * p <= n
    if n % p == 0
      if n % (p * p) != 0
        return 0
      endif
      while n % p == 0
        let n = n / p
      endwhile
    endif
    let p += 1
  endwhile
  return n == 1
endfunction

echo filter(range(1, 100), 'IsPowerful(v:val)')
