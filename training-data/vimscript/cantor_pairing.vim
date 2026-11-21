" Cantor pairing function and its inverse.
function! Pair(x, y)
  return (a:x + a:y) * (a:x + a:y + 1) / 2 + a:y
endfunction

function! Unpair(z)
  let l:w = (float2nr(sqrt(8.0 * a:z + 1)) - 1) / 2
  let l:y = a:z - l:w * (l:w + 1) / 2
  return [l:w - l:y, l:y]
endfunction

echo Pair(3, 4)
echo join(Unpair(32), ' ')
