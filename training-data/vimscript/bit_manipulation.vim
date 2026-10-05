function! Popcount(n)
  let n = a:n
  let bits = 0
  while n != 0
    let n = and(n, n - 1)
    let bits += 1
  endwhile
  return bits
endfunction

echo Popcount(255)
echo and(12, 10)
echo or(12, 10)
echo xor(12, 10)
echo invert(0)
echo and(8 / 8, 1)
echo float2nr(pow(2, 10))
echo printf('%b', xor(5, 3))
echo and(12, -12)
