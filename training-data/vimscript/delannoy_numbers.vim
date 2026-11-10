function! CentralDelannoy(n) abort
  let g = []
  for i in range(a:n + 1)
    let row = []
    for j in range(a:n + 1)
      if i == 0 || j == 0
        call add(row, 1)
      else
        call add(row, g[i - 1][j] + row[j - 1] + g[i - 1][j - 1])
      endif
    endfor
    call add(g, row)
  endfor
  return g[a:n][a:n]
endfunction

echo join(map(range(6), 'CentralDelannoy(v:val)'), ' ')
" Expected output: 1 3 13 63 321 1683
