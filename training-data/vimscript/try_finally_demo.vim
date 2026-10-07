function! s:WithCleanup(fail) abort
  let l:log = []
  try
    call add(l:log, 'start')
    if a:fail
      throw 'boom'
    endif
    call add(l:log, 'body done')
  catch /^boom$/
    call add(l:log, 'caught')
  finally
    call add(l:log, 'cleanup')
  endtry
  return l:log
endfunction

echo s:WithCleanup(0)
echo s:WithCleanup(1)

function! s:ReturnInTry() abort
  try
    return 'from try'
  finally
    echo 'finally runs before returning'
  endtry
endfunction
echo s:ReturnInTry()

let s:order = []
try
  try
    throw 'inner'
  finally
    call add(s:order, 'inner finally')
  endtry
catch /inner/
  call add(s:order, 'outer caught')
endtry
echo s:order

try
  echo 1 / 0
catch /E/
  echo 'error caught: ' . v:exception[0:3]
endtry

try
  throw 'Custom:42'
catch /^Custom:\(\d\+\)$/
  echo 'code ' . matchlist(v:exception, '^Custom:\(\d\+\)$')[1]
endtry

try
  call nonexistent_function()
catch /E117/
  echo 'unknown function'
endtry

for s:i in range(3)
  try
    if s:i == 1 | continue | endif
    echo 'iteration ' . s:i
  finally
    echo 'cleanup ' . s:i
  endtry
endfor
