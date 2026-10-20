nnoremap <silent> <leader>w :w<CR>
inoremap jk <Esc>
vnoremap < <gv
nmap <F5> :echo 'f5'<CR>
echo maparg('jk', 'i') mapcheck('<leader>w', 'n') hasmapto('<Esc>', 'i')
command! -nargs=1 Greet echo 'Hello, ' . <q-args>
command! -nargs=* -complete=file Show echo <q-args> len(<q-args>)
command! -range=% CountLines echo <line2> - <line1> + 1
command! -bang Force echo '<bang>' == '!' ? 'forced' : 'normal'
Greet world
Show a b c
Force!
Force
echo exists(':Greet') exists(':NoSuchCommand')
silent! delcommand Greet
echo exists(':Greet')
function! s:Helper() abort
  return 'script-local'
endfunction
nnoremap <silent> <leader>h :echo <SID>Helper()<CR>
echo s:Helper()
unmap <F5>
iunmap jk
echo maparg('jk', 'i') == ''
abbreviate teh the
iabbrev @@ user@example.com
echo expand('<sfile>') == '' len(execute('map'))  >= 0
