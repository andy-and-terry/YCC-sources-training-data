try
  call undefined_function()
catch /E117/
  echo 'function missing'
finally
  echo 'done'
endtry
