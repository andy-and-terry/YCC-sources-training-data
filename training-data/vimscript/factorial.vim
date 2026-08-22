function! Factorial(n)
  if a:n <= 1
    return 1
  endif
  return a:n * Factorial(a:n - 1)
endfunction

echo Factorial(5)
echo Factorial(10)
