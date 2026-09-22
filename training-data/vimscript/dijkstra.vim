function! Dijkstra(graph, start)
  let dist = {}
  for node in keys(a:graph)
    let dist[node] = 999999
  endfor
  let dist[a:start] = 0
  let visited = {}

  while len(visited) < len(a:graph)
    let u = ''
    let best = 999999
    for node in keys(a:graph)
      if !has_key(visited, node) && dist[node] < best
        let best = dist[node]
        let u = node
      endif
    endfor
    if u ==# ''
      break
    endif
    let visited[u] = 1
    for [v, w] in items(a:graph[u])
      if dist[u] + w < dist[v]
        let dist[v] = dist[u] + w
      endif
    endfor
  endwhile

  return dist
endfunction

let graph = {
      \ 'a': {'b': 4, 'c': 1},
      \ 'b': {'d': 1},
      \ 'c': {'b': 1, 'd': 5},
      \ 'd': {}
      \ }
echo Dijkstra(graph, 'a')
