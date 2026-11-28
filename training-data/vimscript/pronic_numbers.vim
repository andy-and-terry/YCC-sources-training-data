function! IsPronic(x) abort
  let l:n = float2nr(sqrt(a:x))
  return l:n * (l:n + 1) == a:x
endfunction

echo join(map(range(0, 9), 'v:val * (v:val + 1)'), ' ') " 0 2 6 12 20 30 42 56 72 90
echo IsPronic(56) IsPronic(57) " 1 0
