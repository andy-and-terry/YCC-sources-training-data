function! PrimeFactors(n)
  let factors = []
  let n = a:n
  let d = 2
  while d * d <= n
    while n % d == 0
      call add(factors, d)
      let n = n / d
    endwhile
    let d += 1
  endwhile
  if n > 1
    call add(factors, n)
  endif
  return factors
endfunction

echo PrimeFactors(360)
echo PrimeFactors(97)
echo PrimeFactors(1001)
