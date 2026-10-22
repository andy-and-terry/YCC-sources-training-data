function! Golomb(count)
  " a[0] is a placeholder so indices match the 1-based definition
  let a = [0, 1]
  for n in range(2, a:count)
    call add(a, 1 + a[n - a[a[n - 1]]])
  endfor
  return a[1 :]
endfunction

echo join(Golomb(20), ' ')
