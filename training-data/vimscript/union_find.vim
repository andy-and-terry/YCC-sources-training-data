function! UfInit(n)
  return range(a:n)
endfunction

function! UfFind(parent, x)
  if a:parent[a:x] == a:x
    return a:x
  endif
  return UfFind(a:parent, a:parent[a:x])
endfunction

function! UfUnion(parent, x, y)
  let rootX = UfFind(a:parent, a:x)
  let rootY = UfFind(a:parent, a:y)
  if rootX != rootY
    let a:parent[rootX] = rootY
  endif
endfunction

let parent = UfInit(5)
call UfUnion(parent, 0, 1)
call UfUnion(parent, 1, 2)
echo UfFind(parent, 0) == UfFind(parent, 2)
echo UfFind(parent, 0) == UfFind(parent, 3)
