function! VisitNode(node, graph, visited, order)
  if index(a:visited, a:node) != -1
    return
  endif
  call add(a:visited, a:node)
  for dep in get(a:graph, a:node, [])
    call VisitNode(dep, a:graph, a:visited, a:order)
  endfor
  call add(a:order, a:node)
endfunction

let graph = {'a': ['b', 'c'], 'b': ['d'], 'c': ['d'], 'd': []}
let visited = []
let order = []
for node in keys(graph)
  call VisitNode(node, graph, visited, order)
endfor
echo order
