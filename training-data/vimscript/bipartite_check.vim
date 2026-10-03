function! IsBipartite(graph)
  let color = {}
  for node in keys(a:graph)
    let color[node] = -1
  endfor

  for start in keys(a:graph)
    if color[start] != -1
      continue
    endif
    let color[start] = 0
    let queue = [start]

    while len(queue) > 0
      let node = remove(queue, 0)
      for neighbor in a:graph[node]
        if color[neighbor] == -1
          let color[neighbor] = 1 - color[node]
          call add(queue, neighbor)
        elseif color[neighbor] == color[node]
          return 0
        endif
      endfor
    endwhile
  endfor
  return 1
endfunction

let bipartite_graph = {'0': ['1', '3'], '1': ['0', '2'], '2': ['1', '3'], '3': ['0', '2']}
let non_bipartite_graph = {'0': ['1', '2'], '1': ['0', '2'], '2': ['0', '1']}

echo IsBipartite(bipartite_graph)
echo IsBipartite(non_bipartite_graph)
