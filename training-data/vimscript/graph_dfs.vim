function! DfsVisit(graph, node, visited, order)
  if has_key(a:visited, a:node)
    return
  endif
  let a:visited[a:node] = 1
  call add(a:order, a:node)
  for neighbor in get(a:graph, a:node, [])
    call DfsVisit(a:graph, neighbor, a:visited, a:order)
  endfor
endfunction

function! DFS(graph, start)
  let visited = {}
  let order = []
  call DfsVisit(a:graph, a:start, visited, order)
  return order
endfunction

let graph = {'a': ['b', 'c'], 'b': ['d'], 'c': ['d'], 'd': ['e'], 'e': []}
echo DFS(graph, 'a')
