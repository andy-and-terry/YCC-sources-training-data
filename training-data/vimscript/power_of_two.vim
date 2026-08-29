function! IsPowerOfTwo(n)
  return a:n > 0 && and(a:n, a:n - 1) == 0
endfunction

echo IsPowerOfTwo(16)
echo IsPowerOfTwo(18)
