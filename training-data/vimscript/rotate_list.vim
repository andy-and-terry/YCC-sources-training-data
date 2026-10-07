function! RotateLeft(list, k)
  let n = len(a:list)
  if n == 0
    return []
  endif
  let k = a:k % n
  if k == 0
    return copy(a:list)
  endif
  return a:list[k :] + a:list[: k - 1]
endfunction

function! RotateRight(list, k)
  if empty(a:list)
    return []
  endif
  return RotateLeft(a:list, len(a:list) - (a:k % len(a:list)))
endfunction

echo RotateLeft([1, 2, 3, 4, 5], 2)
echo RotateRight([1, 2, 3, 4, 5], 2)
echo RotateLeft([1, 2, 3], 3)
