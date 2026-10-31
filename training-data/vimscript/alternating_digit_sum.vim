function! AlternatingDigitSum(n)
  let n = a:n
  let total = 0
  let sign = 1
  while n > 0
    let total += sign * (n % 10)
    let sign = -sign
    let n = n / 10
  endwhile
  return total
endfunction

for n in [1234, 99999, 1000]
  echo n AlternatingDigitSum(n)
endfor
