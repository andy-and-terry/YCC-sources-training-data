function! s:Greet(name) abort
  return 'Hello, ' . a:name
endfunction
echo s:Greet('Vim')
