" Rotate a square matrix 90 degrees clockwise.
function! s:Rotate(m) abort
  let l:n = len(a:m)
  let l:r = map(range(l:n), {-> repeat([0], l:n)})
  for l:i in range(l:n)
    for l:j in range(l:n)
      let l:r[l:j][l:n - 1 - l:i] = a:m[l:i][l:j]
    endfor
  endfor
  return l:r
endfunction
for s:row in s:Rotate([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
  echo join(s:row, ' ')
endfor
