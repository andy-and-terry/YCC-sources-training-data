function! DigitSum(n)
  let n = a:n
  let total = 0
  while n > 0
    let total += n % 10
    let n = n / 10
  endwhile
  return total
endfunction

echo DigitSum(12345)
