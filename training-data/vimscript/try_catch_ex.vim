try
  let x = 1 / 0
catch /E\d\+/
  echo 'caught: ' . v:exception
finally
  echo 'cleanup'
endtry
