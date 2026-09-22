function! AvlHeight(node)
  return empty(a:node) ? 0 : a:node.height
endfunction

function! AvlUpdateHeight(node)
  let a:node.height = 1 + max([AvlHeight(a:node.left), AvlHeight(a:node.right)])
endfunction

function! AvlBalanceFactor(node)
  return empty(a:node) ? 0 : AvlHeight(a:node.left) - AvlHeight(a:node.right)
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

function! AvlInsert(node, value)
  if empty(a:node)
    return {'value': a:value, 'left': {}, 'right': {}, 'height': 1}
  endif
  if a:value < a:node.value
    let a:node.left = AvlInsert(a:node.left, a:value)
  elseif a:value > a:node.value
    let a:node.right = AvlInsert(a:node.right, a:value)
  else
    return a:node
  endif

  call AvlUpdateHeight(a:node)
  let balance = AvlBalanceFactor(a:node)

  " Left-left case
  if balance > 1 && a:value < a:node.left.value
    return AvlRotateRight(a:node)
  endif
  " Right-right case
  if balance < -1 && a:value > a:node.right.value
    return AvlRotateLeft(a:node)
  endif
  " Left-right case
  if balance > 1 && a:value > a:node.left.value
    let a:node.left = AvlRotateLeft(a:node.left)
    return AvlRotateRight(a:node)
  endif
  " Right-left case
  if balance < -1 && a:value < a:node.right.value
    let a:node.right = AvlRotateRight(a:node.right)
    return AvlRotateLeft(a:node)
  endif

  return a:node
endfunction

function! AvlInorder(node)
  if empty(a:node)
    return []
  endif
  return AvlInorder(a:node.left) + [a:node.value] + AvlInorder(a:node.right)
endfunction

let root = {}
for v in [10, 20, 30, 40, 50, 25]
  let root = AvlInsert(root, v)
endfor
echo AvlInorder(root)
echo root.value
echo root.height
