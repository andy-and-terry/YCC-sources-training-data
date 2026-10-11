" Rotate a string by slicing.
function! s:RotateLeft(s, n) abort
  let l:k = a:n % len(a:s)
  return a:s[l:k :] . a:s[: l:k - 1]
endfunction
echo s:RotateLeft('abcdef', 2)
echo s:RotateLeft('abcdef', 8)
echo s:RotateLeft('hello', 0)
