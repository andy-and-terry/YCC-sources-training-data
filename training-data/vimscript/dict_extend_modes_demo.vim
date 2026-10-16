" extend() on dictionaries with force, keep and error modes.
let s:base = {'a': 1, 'b': 2}
let s:over = {'b': 20, 'c': 30}
echo extend(copy(s:base), s:over)
echo extend(copy(s:base), s:over, 'keep')
echo extend(copy(s:base), s:over, 'force')
try
  call extend(copy(s:base), s:over, 'error')
catch /E737/
  echo 'duplicate key rejected'
endtry
