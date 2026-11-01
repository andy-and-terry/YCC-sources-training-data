" n is triangular iff 8n + 1 is a perfect square.
function! IsTriangular(n)
  let l:s = 8 * a:n + 1
  let l:r = float2nr(round(sqrt(l:s)))
  return l:r * l:r == l:s
endfunction

echo join(filter(range(0, 20), 'IsTriangular(v:val)'), ' ')
