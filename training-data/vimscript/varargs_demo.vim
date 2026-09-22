function! SumAll(...)
  let total = 0
  for n in a:000
    let total += n
  endfor
  return total
endfunction

function! Describe(first, ...)
  return a:first . ' (extra args: ' . a:0 . ') -> ' . join(a:000, ', ')
endfunction

echo SumAll(1, 2, 3, 4)
echo Describe('x', 'y', 'z')
