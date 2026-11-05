let mapleader = ','
nnoremap <leader>w :w<CR>
nnoremap <silent> <leader>h :nohlsearch<CR>
command! -nargs=1 Greet echo 'Hello, ' . <q-args>
Greet world
