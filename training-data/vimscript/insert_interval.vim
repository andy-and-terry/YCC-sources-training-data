function! InsertInterval(iv, new) abort
  let [lo, hi] = a:new
  let out = []
  let placed = 0
  for [l, h] in a:iv
    if h < lo
      call add(out, [l, h])
    elseif l > hi
      if !placed | call add(out, [lo, hi]) | let placed = 1 | endif
      call add(out, [l, h])
    else
      let lo = min([lo, l])
      let hi = max([hi, h])
    endif
  endfor
  if !placed | call add(out, [lo, hi]) | endif
  return out
endfunction

echo InsertInterval([[1, 3], [6, 9]], [2, 5])  " [[1, 5], [6, 9]]
