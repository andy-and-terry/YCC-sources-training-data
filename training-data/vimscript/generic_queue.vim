let queueItems = []

function! QueueEnqueue(value)
  call add(g:queueItems, a:value)
endfunction

function! QueueDequeue()
  return remove(g:queueItems, 0)
endfunction

call QueueEnqueue(1)
call QueueEnqueue(2)
call QueueEnqueue(3)
echo QueueDequeue()
echo QueueDequeue()
