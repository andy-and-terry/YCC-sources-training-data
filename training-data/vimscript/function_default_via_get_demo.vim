" Optional arguments with defaults using a:0 and get(a:000, ...).
function! s:Greet(name, ...) abort
  let l:greeting = get(a:000, 0, 'Hello')
  let l:punct = get(a:000, 1, '!')
  return l:greeting . ', ' . a:name . l:punct
endfunction

echo s:Greet('Ann')
echo s:Greet('Ann', 'Hi')
echo s:Greet('Ann', 'Hey', '?')
