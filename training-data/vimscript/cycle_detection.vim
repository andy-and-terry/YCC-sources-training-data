" Directed-cycle detection via DFS with a recursion-stack marker.
let s:graph = {
      \ 'a': ['b'],
      \ 'b': ['c'],
      \ 'c': ['a', 'd'],
      \ 'd': [],
      \ }

function! DfsHasCycle(node, visited, onStack)
  let a:visited[a:node] = 1
  let a:onStack[a:node] = 1
  for neighbor in get(s:graph, a:node, [])
    if !has_key(a:visited, neighbor)
      if DfsHasCycle(neighbor, a:visited, a:onStack)
        return 1
      endif
    elseif get(a:onStack, neighbor, 0)
      return 1
    endif
  endfor
  let a:onStack[a:node] = 0
  return 0
endfunction

function! HasCycle()
  let visited = {}
  let onStack = {}
  for node in keys(s:graph)
    if !has_key(visited, node)
      if DfsHasCycle(node, visited, onStack)
        return 1
      endif
    endif
  endfor
  return 0
endfunction

if HasCycle()
  echo 'cycle detected'
else
  echo 'no cycle'
endif
