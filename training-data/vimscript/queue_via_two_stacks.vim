function! NewQueue()
  return {'inbox': [], 'outbox': []}
endfunction

function! QueuePush(q, value)
  call add(a:q.inbox, a:value)
endfunction

function! QueuePop(q)
  if empty(a:q.outbox)
    while !empty(a:q.inbox)
      call add(a:q.outbox, remove(a:q.inbox, -1))
    endwhile
  endif
  return remove(a:q.outbox, -1)
endfunction

let q = NewQueue()
call QueuePush(q, 1)
call QueuePush(q, 2)
call QueuePush(q, 3)
echo QueuePop(q)
call QueuePush(q, 4)
echo QueuePop(q)
echo QueuePop(q)
echo QueuePop(q)
