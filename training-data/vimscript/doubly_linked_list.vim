function! DllNew()
  return {'head': {}, 'tail': {}}
endfunction

function! DllPushBack(list, value)
  let node = {'value': a:value, 'prev': a:list.tail, 'next': {}}
  if empty(a:list.tail)
    let a:list.head = node
  else
    let a:list.tail.next = node
  endif
  let a:list.tail = node
endfunction

function! DllPushFront(list, value)
  let node = {'value': a:value, 'prev': {}, 'next': a:list.head}
  if empty(a:list.head)
    let a:list.tail = node
  else
    let a:list.head.prev = node
  endif
  let a:list.head = node
endfunction

function! DllToArrayForward(list)
  let result = []
  let node = a:list.head
  while !empty(node)
    call add(result, node.value)
    let node = node.next
  endwhile
  return result
endfunction

function! DllToArrayBackward(list)
  let result = []
  let node = a:list.tail
  while !empty(node)
    call add(result, node.value)
    let node = node.prev
  endwhile
  return result
endfunction

let list = DllNew()
call DllPushBack(list, 2)
call DllPushBack(list, 3)
call DllPushFront(list, 1)
echo DllToArrayForward(list)
echo DllToArrayBackward(list)
