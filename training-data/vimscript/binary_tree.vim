function! InsertNode(node, value)
  if empty(a:node)
    return {'value': a:value, 'left': {}, 'right': {}}
  endif
  if a:value < a:node.value
    let a:node.left = InsertNode(a:node.left, a:value)
  elseif a:value > a:node.value
    let a:node.right = InsertNode(a:node.right, a:value)
  endif
  return a:node
endfunction

function! Inorder(node)
  if empty(a:node)
    return []
  endif
  return Inorder(a:node.left) + [a:node.value] + Inorder(a:node.right)
endfunction

let root = {}
for v in [5, 3, 8, 1, 4, 7, 9]
  let root = InsertNode(root, v)
endfor
echo Inorder(root)
