try
  throw 'my error'
catch /my error/
  echo 'caught: ' . v:exception
finally
  echo 'cleanup'
endtry
