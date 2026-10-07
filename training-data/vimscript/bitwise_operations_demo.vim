" Vimscript's built-in bitwise functions: and(), or(), xor(), invert().
" Vimscript has no native << / >> shift operators, so shifting is done via
" multiplication/division by a power of two instead.
let a = 0x0F
let b = 0x33

echo and(a, b)
echo or(a, b)
echo xor(a, b)
echo and(invert(a), 0xFF)

function! PowerOfTwo(bits)
  let result = 1
  for i in range(a:bits)
    let result = result * 2
  endfor
  return result
endfunction

function! ShiftLeft(value, bits)
  return a:value * PowerOfTwo(a:bits)
endfunction

function! ShiftRight(value, bits)
  return a:value / PowerOfTwo(a:bits)
endfunction

echo ShiftLeft(3, 4)
echo ShiftRight(48, 4)
