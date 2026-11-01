command! -nargs=1 Greet echo 'Hello, ' . <q-args>
command! -range=% StripBlank <line1>,<line2>g/^\s*$/d
nnoremap <silent> <leader>w :write<CR>
Greet World
