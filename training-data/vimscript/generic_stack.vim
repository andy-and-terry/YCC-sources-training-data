let stackItems = []

function! StackPush(value)
  call add(g:stackItems, a:value)
endfunction

function! StackPop()
  return remove(g:stackItems, -1)
endfunction

call StackPush(1)
call StackPush(2)
call StackPush(3)
echo StackPop()
echo StackPop()
