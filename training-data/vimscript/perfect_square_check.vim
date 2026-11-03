function! IsPerfectSquare(n) abort
  if a:n < 0
    return 0
  endif
  let l:r = float2nr(round(sqrt(a:n)))
  return l:r * l:r == a:n
endfunction

echo filter(range(0, 29), {_, n -> IsPerfectSquare(n)})
