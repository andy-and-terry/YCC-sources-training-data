" Floyd-Warshall all-pairs shortest paths over a small adjacency matrix.
function! FloydWarshall(matrix)
  let n = len(a:matrix)
  let dist = deepcopy(a:matrix)
  for k in range(n)
    for i in range(n)
      for j in range(n)
        if dist[i][k] + dist[k][j] < dist[i][j]
          let dist[i][j] = dist[i][k] + dist[k][j]
        endif
      endfor
    endfor
  endfor
  return dist
endfunction

let g:INF = 999999
let matrix = [
      \ [0, 3, g:INF, 7],
      \ [8, 0, 2, g:INF],
      \ [5, g:INF, 0, 1],
      \ [2, g:INF, g:INF, 0],
      \ ]

let result = FloydWarshall(matrix)
for row in result
  echo row
endfor
