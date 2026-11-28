" Central Delannoy numbers via the recurrence D(i,j) = D(i-1,j) + D(i,j-1) + D(i-1,j-1)
let n = 7
let d = map(range(n + 1), 'repeat([1], n + 1)')
for i in range(1, n)
  for j in range(1, n)
    let d[i][j] = d[i - 1][j] + d[i][j - 1] + d[i - 1][j - 1]
  endfor
endfor
echo join(map(range(n + 1), 'd[v:val][v:val]'), ' ')
