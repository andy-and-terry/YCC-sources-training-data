let s:count = 0
function! s:Bump() abort
  let s:count += 1
  return s:count
endfunction
call s:Bump()
call s:Bump()
echo s:count
