" Dijkstra's shortest path using a simple O(V^2) unvisited-set scan.
function! Dijkstra(graph, source)
  let dist = {}
  let visited = {}
  for node in keys(a:graph)
    let dist[node] = 999999
  endfor
  let dist[a:source] = 0
  let remaining = len(keys(a:graph))
  while remaining > 0
    let u = ''
    let best = 999999
    for node in keys(a:graph)
      if !has_key(visited, node) && dist[node] < best
        let best = dist[node]
        let u = node
      endif
    endfor
    if u == ''
      break
    endif
    let visited[u] = 1
    for [v, w] in get(a:graph, u, [])
      if dist[u] + w < dist[v]
        let dist[v] = dist[u] + w
      endif
    endfor
    let remaining -= 1
  endwhile
  return dist
endfunction

let graph = {
      \ 'a': [['b', 1], ['c', 4]],
      \ 'b': [['c', 2], ['d', 5]],
      \ 'c': [['d', 1]],
      \ 'd': [],
      \ }
echo Dijkstra(graph, 'a')
