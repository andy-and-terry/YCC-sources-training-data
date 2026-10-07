function! FloydWarshall(dist, n)
  let dist = deepcopy(a:dist)
  for k in range(a:n)
    for i in range(a:n)
      for j in range(a:n)
        if dist[i][k] + dist[k][j] < dist[i][j]
          let dist[i][j] = dist[i][k] + dist[k][j]
        endif
      endfor
    endfor
  endfor
  return dist
endfunction

let inf = 999999
let dist = [
      \ [0, 5, inf, 10],
      \ [inf, 0, 3, inf],
      \ [inf, inf, 0, 1],
      \ [inf, inf, inf, 0],
      \ ]

let result = FloydWarshall(dist, 4)
for row in result
  echo row
endfor
