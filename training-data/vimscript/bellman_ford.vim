" Bellman-Ford shortest paths, tolerant of negative edge weights.
function! BellmanFord(nodes, edges, source)
  let dist = {}
  for node in a:nodes
    let dist[node] = 999999
  endfor
  let dist[a:source] = 0

  for i in range(len(a:nodes) - 1)
    for [u, v, w] in a:edges
      if dist[u] != 999999 && dist[u] + w < dist[v]
        let dist[v] = dist[u] + w
      endif
    endfor
  endfor

  return dist
endfunction

let nodes = ['a', 'b', 'c', 'd']
let edges = [
      \ ['a', 'b', 4],
      \ ['a', 'c', 5],
      \ ['b', 'c', -3],
      \ ['c', 'd', 2],
      \ ]

echo BellmanFord(nodes, edges, 'a')
