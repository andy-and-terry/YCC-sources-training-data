let a = 12
let b = 10
echo and(a, b)
echo or(a, b)
echo xor(a, b)
echo invert(0)
echo and(invert(a), 15)

function! IsSet(value, bit) abort
  return and(a:value, 1 << a:bit) != 0
endfunction

function! PopCount(n) abort
  let n = a:n
  let c = 0
  while n
    let c += and(n, 1)
    let n = n / 2
  endwhile
  return c
endfunction

echo IsSet(5, 0) IsSet(5, 1) IsSet(5, 2)
echo PopCount(255)
echo 1 << 8
