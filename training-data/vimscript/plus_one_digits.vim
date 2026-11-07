function! PlusOne(digits) abort
  let d = copy(a:digits)
  for i in range(len(d) - 1, 0, -1)
    if d[i] < 9
      let d[i] += 1
      return d
    endif
    let d[i] = 0
  endfor
  return [1] + d
endfunction

echo PlusOne([1, 2, 9])  " [1, 3, 0]
echo PlusOne([9, 9])     " [1, 0, 0]
