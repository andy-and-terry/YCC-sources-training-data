" Breadth-first search over an adjacency-list graph starting from a given node.
function! BFS(graph, start)
  let visited = {a:start: 1}
  let queue = [a:start]
  let order = []
  while !empty(queue)
    let node = remove(queue, 0)
    call add(order, node)
    for neighbor in get(a:graph, node, [])
      if !has_key(visited, neighbor)
        let visited[neighbor] = 1
        call add(queue, neighbor)
      endif
    endfor
  endwhile
  return order
endfunction

let graph = {'a': ['b', 'c'], 'b': ['d'], 'c': ['d'], 'd': ['e'], 'e': []}
echo BFS(graph, 'a')
