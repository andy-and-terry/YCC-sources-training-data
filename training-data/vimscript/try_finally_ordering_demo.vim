function! s:run() abort
  try
    echo 'in try'
    throw 'oops'
  catch /^oops$/
    echo 'caught ' . v:exception
  finally
    echo 'finally always runs'
  endtry
endfunction

call s:run()
