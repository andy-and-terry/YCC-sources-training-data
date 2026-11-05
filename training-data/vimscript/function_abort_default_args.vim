function! s:Greet(name, ...) abort
  let greeting = a:0 > 0 ? a:1 : 'Hello'
  return greeting . ', ' . a:name
endfunction
echo s:Greet('Ann')
echo s:Greet('Ann', 'Hi')
