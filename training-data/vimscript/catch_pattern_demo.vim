function! Validate(x)
  if a:x < 0
    throw 'RangeError: value must be non-negative'
  endif
  if a:x > 100
    throw 'LimitError: value exceeds maximum'
  endif
  return a:x * 2
endfunction

function! SafeValidate(x)
  try
    return Validate(a:x)
  catch /^RangeError/
    echo 'caught range error'
    return -1
  catch /^LimitError/
    echo 'caught limit error'
    return -1
  catch
    echo 'caught unknown error: ' . v:exception
    return -1
  endtry
endfunction

echo SafeValidate(5)
echo SafeValidate(-3)
echo SafeValidate(500)
