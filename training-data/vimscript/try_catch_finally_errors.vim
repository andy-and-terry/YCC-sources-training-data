try
  call nonexistent_function()
catch /E117/
  echo 'caught undefined function'
finally
  echo 'finally'
endtry
try
  throw 'custom'
catch /^custom$/
  echo 'custom caught'
endtry
