function! Risky(n)
  try
    if a:n < 0
      throw 'negative input'
    endif
    echo 'ok: ' . a:n
    return a:n
  catch /^negative/
    echo 'caught: ' . v:exception
    return -1
  finally
    echo 'cleanup for ' . a:n
  endtry
endfunction

echo Risky(5)
echo Risky(-1)
