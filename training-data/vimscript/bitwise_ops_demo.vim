let a = 12
let b = 10

echo and(a, b)
echo or(a, b)
echo xor(a, b)
echo invert(0)

" Shifts via multiplication and division
echo a * 4
echo a / 4

" Test, set and clear a bit
let flags = 0
let flags = or(flags, 1 * 8)
echo and(flags, 8) != 0
let flags = and(flags, invert(8))
echo flags

" Popcount
function! PopCount(n)
  let n = a:n
  let c = 0
  while n > 0
    let c += and(n, 1)
    let n = n / 2
  endwhile
  return c
endfunction
echo PopCount(255)
