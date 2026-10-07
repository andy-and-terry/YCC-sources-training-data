function! MakeNode(value)
  return {'value': a:value, 'next': {}}
endfunction

function! HasCycle(head)
  let slow = a:head
  let fast = a:head
  while !empty(fast) && !empty(fast.next)
    let slow = slow.next
    let fast = fast.next.next
    if slow is fast
      return 1
    endif
  endwhile
  return 0
endfunction

let n1 = MakeNode(1)
let n2 = MakeNode(2)
let n3 = MakeNode(3)
let n1.next = n2
let n2.next = n3
echo HasCycle(n1)

let n3.next = n1
echo HasCycle(n1)
