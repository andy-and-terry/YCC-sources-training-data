function! EditDistance(a, b)
  let m = len(a:a)
  let n = len(a:b)
  let table = []
  for i in range(m + 1)
    call add(table, repeat([0], n + 1))
  endfor
  for i in range(m + 1)
    let table[i][0] = i
  endfor
  for j in range(n + 1)
    let table[0][j] = j
  endfor
  for i in range(1, m)
    for j in range(1, n)
      let cost = a:a[i - 1] ==# a:b[j - 1] ? 0 : 1
      let table[i][j] = min([table[i - 1][j] + 1, table[i][j - 1] + 1, table[i - 1][j - 1] + cost])
    endfor
  endfor
  return table[m][n]
endfunction

echo EditDistance('kitten', 'sitting')
