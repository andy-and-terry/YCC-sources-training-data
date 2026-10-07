function! BellmanFord(edges, node_count, source)
  let dist = repeat([999999], a:node_count)
  let dist[a:source] = 0

  for iter in range(a:node_count - 1)
    for edge in a:edges
      let [u, v, w] = edge
      if dist[u] + w < dist[v]
        let dist[v] = dist[u] + w
      endif
    endfor
  endfor

  return dist
endfunction

let edges = [[0, 1, 4], [0, 2, 5], [1, 2, -3], [2, 3, 4], [3, 1, -1]]
echo BellmanFord(edges, 4, 0)
