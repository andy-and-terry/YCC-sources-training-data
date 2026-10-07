function! NewAvlNode(key)
  return {'key': a:key, 'left': {}, 'right': {}, 'height': 1}
endfunction

function! AvlHeight(node)
  return empty(a:node) ? 0 : a:node.height
endfunction

function! AvlUpdateHeight(node)
  let a:node.height = 1 + max([AvlHeight(a:node.left), AvlHeight(a:node.right)])
endfunction

function! AvlBalance(node)
  return AvlHeight(a:node.left) - AvlHeight(a:node.right)
endfunction

function! AvlRotateRight(y)
  let x = a:y.left
  let t2 = x.right
  let x.right = a:y
  let a:y.left = t2
  call AvlUpdateHeight(a:y)
  call AvlUpdateHeight(x)
  return x
endfunction

function! AvlRotateLeft(x)
  let y = a:x.right
  let t2 = y.left
  let y.left = a:x
  let a:x.right = t2
  call AvlUpdateHeight(a:x)
  call AvlUpdateHeight(y)
  return y
endfunction

function! AvlInsert(node, key)
  if empty(a:node)
    return NewAvlNode(a:key)
  endif

  if a:key < a:node.key
    let a:node.left = AvlInsert(a:node.left, a:key)
  elseif a:key > a:node.key
    let a:node.right = AvlInsert(a:node.right, a:key)
  else
    return a:node
  endif

  call AvlUpdateHeight(a:node)
  let balance = AvlBalance(a:node)

  if balance > 1 && a:key < a:node.left.key
    return AvlRotateRight(a:node)
  elseif balance < -1 && a:key > a:node.right.key
    return AvlRotateLeft(a:node)
  elseif balance > 1 && a:key > a:node.left.key
    let a:node.left = AvlRotateLeft(a:node.left)
    return AvlRotateRight(a:node)
  elseif balance < -1 && a:key < a:node.right.key
    let a:node.right = AvlRotateRight(a:node.right)
    return AvlRotateLeft(a:node)
  endif
  return a:node
endfunction

function! AvlInOrder(node)
  if empty(a:node)
    return []
  endif
  return AvlInOrder(a:node.left) + [a:node.key] + AvlInOrder(a:node.right)
endfunction

let root = {}
for v in [10, 20, 30, 40, 50, 25]
  let root = AvlInsert(root, v)
endfor
echo AvlInOrder(root)
echo AvlHeight(root)
