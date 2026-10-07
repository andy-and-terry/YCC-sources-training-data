function! ListNew()
  return {'head': {}}
endfunction

function! ListPushFront(list, value)
  let node = {'value': a:value, 'next': a:list.head}
  let a:list.head = node
endfunction

function! ListToArray(list)
  let result = []
  let node = a:list.head
  while !empty(node)
    call add(result, node.value)
    let node = node.next
  endwhile
  return result
endfunction

let list = ListNew()
call ListPushFront(list, 3)
call ListPushFront(list, 2)
call ListPushFront(list, 1)
echo ListToArray(list)
