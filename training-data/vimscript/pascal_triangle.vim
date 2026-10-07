function! PascalTriangle(n)
  let rows = []
  for i in range(a:n)
    let row = [1]
    if i > 0
      let prev = rows[i - 1]
      for j in range(1, i - 1)
        call add(row, prev[j - 1] + prev[j])
      endfor
      call add(row, 1)
    endif
    call add(rows, row)
  endfor
  return rows
endfunction

for row in PascalTriangle(6)
  echo join(row, ' ')
endfor
