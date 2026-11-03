function! SwapCase(s) abort
  return join(map(split(a:s, '\zs'), {_, c -> c =~# '\u' ? tolower(c) : toupper(c)}), '')
endfunction

echo SwapCase("Hello World 42")
