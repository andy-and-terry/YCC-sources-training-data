function! Transpose(matrix)
  let rows = len(a:matrix)
  let cols = len(a:matrix[0])
  let result = []
  for c in range(cols)
    let row = []
    for r in range(rows)
      call add(row, a:matrix[r][c])
    endfor
    call add(result, row)
  endfor
  return result
endfunction

echo Transpose([[1, 2], [3, 4]])
