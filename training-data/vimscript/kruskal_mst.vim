let s:parent = {}

function! Find(x)
  if s:parent[a:x] != a:x
    let s:parent[a:x] = Find(s:parent[a:x])
  endif
  return s:parent[a:x]
endfunction

function! UnionSets(a, b)
  let root_a = Find(a:a)
  let root_b = Find(a:b)
  if root_a == root_b
    return 0
  endif
  let s:parent[root_a] = root_b
  return 1
endfunction

function! KruskalMst(n, edges)
  for i in range(a:n)
    let s:parent[i] = i
  endfor

  let sorted_edges = sort(copy(a:edges), {a, b -> a[2] - b[2]})
  let total = 0
  let used = []

  for edge in sorted_edges
    let [u, v, w] = edge
    if UnionSets(u, v)
      let total += w
      call add(used, edge)
    endif
  endfor

  return [total, used]
endfunction

let edges = [[0, 1, 2], [1, 2, 3], [0, 2, 6], [2, 3, 8], [3, 4, 7], [1, 4, 5]]
let [total, used] = KruskalMst(5, edges)
echo total
echo used
