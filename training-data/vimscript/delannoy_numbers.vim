function! Delannoy(size)
  let d = []
  for m in range(a:size)
    let row = []
    for n in range(a:size)
      if m == 0 || n == 0
        call add(row, 1)
      else
        call add(row, d[m - 1][n] + row[n - 1] + d[m - 1][n - 1])
      endif
    endfor
    call add(d, row)
  endfor
  return map(range(a:size), 'd[v:val][v:val]')
endfunction

echo join(Delannoy(10), ' ')
