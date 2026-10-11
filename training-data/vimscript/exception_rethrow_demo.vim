" Catch an exception, add context, and rethrow.
function! s:Inner() abort
  throw 'inner: bad value'
endfunction

function! s:Outer() abort
  try
    call s:Inner()
  catch /^inner:/
    throw 'outer wrapped (' . v:exception . ')'
  endtry
endfunction

try
  call s:Outer()
catch
  echo v:exception
endtry
