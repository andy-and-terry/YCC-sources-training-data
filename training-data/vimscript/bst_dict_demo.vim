function! BstInsert(node, value)
  if empty(a:node)
    return {'value': a:value, 'left': {}, 'right': {}}
  endif
  if a:value < a:node.value
    let a:node.left = BstInsert(a:node.left, a:value)
  elseif a:value > a:node.value
    let a:node.right = BstInsert(a:node.right, a:value)
  endif
  return a:node
endfunction

function! BstInorder(node)
  if empty(a:node)
    return []
  endif
  return BstInorder(a:node.left) + [a:node.value] + BstInorder(a:node.right)
endfunction

let tree = {}
for n in [5, 3, 8, 1, 4, 7, 9]
  let tree = BstInsert(tree, n)
endfor

echo BstInorder(tree)
