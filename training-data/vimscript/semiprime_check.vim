function! PrimeFactorCount(n)
  let n = a:n
  let count = 0
  let p = 2
  while p * p <= n
    while n % p == 0
      let n = n / p
      let count += 1
    endwhile
    let p += 1
  endwhile
  return n > 1 ? count + 1 : count
endfunction

echo filter(range(2, 29), 'PrimeFactorCount(v:val) == 2')
