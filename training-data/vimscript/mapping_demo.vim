nnoremap <silent> <leader>w :w<CR>
inoremap jk <Esc>
vnoremap < <gv
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'

echo maparg('jk', 'i')
echo maparg('<leader>w', 'n')
echo mapcheck('jk', 'i') != ''
echo hasmapto(':w<CR>', 'n')

let info = maparg('jk', 'i', 0, 1)
echo info.noremap info.silent info.lhs

inoreabbrev teh the
echo maparg('teh', 'i', 1)

iunmap jk
echo maparg('jk', 'i') == ''

command! -nargs=1 Hello echo 'hello ' . <q-args>
Hello world
