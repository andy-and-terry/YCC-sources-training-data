function! ToggleWrap() abort
  setlocal wrap!
  echo &wrap ? 'wrap on' : 'wrap off'
endfunction
nnoremap <silent> <F5> :call ToggleWrap()<CR>
