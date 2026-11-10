" Read the binary digits of i as base-4 digits.
function! Moser(i) abort
  let x = a:i
  let value = 0
  let power = 1
  while x > 0
    if and(x, 1) | let value += power | endif
    let power *= 4
    let x = x / 2
  endwhile
  return value
endfunction

echo join(map(range(10), 'Moser(v:val)'), ' ')
" Expected output: 0 1 4 5 16 17 20 21 64 65
