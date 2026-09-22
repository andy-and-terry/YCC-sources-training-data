let s:counter = 0

function! s:Increment()
  let s:counter += 1
  return s:counter
endfunction

function! s:Reset()
  let s:counter = 0
endfunction

call s:Increment()
call s:Increment()
echo s:Increment()
call s:Reset()
echo s:counter
