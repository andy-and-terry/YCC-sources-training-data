try
  throw 'custom error'
catch /^custom/
  echo 'caught: ' . v:exception
finally
  echo 'cleanup'
endtry
