" Without 'abort', a function keeps running after an error.
" With 'abort', it stops at the first error.
function! WithoutAbort()
  let l:log = []
  call add(l:log, 'start')
  try
    call NoSuchFunction()
  catch
    call add(l:log, 'caught')
  endtry
  return l:log
endfunction

function! WithAbort() abort
  call add(g:trace, 'before')
  call NoSuchFunction()
  call add(g:trace, 'after')
endfunction

let g:trace = []
try
  call WithAbort()
catch /E117/
  call add(g:trace, 'E117 caught')
endtry

echo WithoutAbort()
echo g:trace
