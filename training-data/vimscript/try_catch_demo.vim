function! SafeDivide(a, b)
  if a:b == 0
    throw 'division by zero'
  endif
  return a:a / a:b
endfunction

try
  echo SafeDivide(10, 2)
  echo SafeDivide(5, 0)
catch
  echo 'error: ' . v:exception
endtry
