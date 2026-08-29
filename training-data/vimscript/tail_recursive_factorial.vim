function! Factorial(n)
  let result = 1
  for i in range(1, a:n)
    let result *= i
  endfor
  return result
endfunction

echo Factorial(10)
