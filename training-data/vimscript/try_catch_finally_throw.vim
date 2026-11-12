try
  throw 'custom'
catch /custom/
  echo 'caught ' . v:exception
finally
  echo 'done'
endtry
