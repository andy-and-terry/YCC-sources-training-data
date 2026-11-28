function! IsAutomorphic(n) abort
  let l:sq = string(a:n * a:n)
  let l:s = string(a:n)
  return strpart(l:sq, len(l:sq) - len(l:s)) ==# l:s
endfunction

echo join(filter(range(0, 999), 'IsAutomorphic(v:val)'), ' ') " 0 1 5 6 25 76 376 625
