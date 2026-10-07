function! Sum(...)
  let total = 0
  for v in a:000
    let total += v
  endfor
  return total
endfunction

function! Describe(label, ...)
  return a:label . ': ' . string(a:000) . ' (' . a:0 . ' extra)'
endfunction

echo Sum(1, 2, 3)
echo Sum(10, 20, 30, 40)
echo Describe('values', 1, 2, 3)
