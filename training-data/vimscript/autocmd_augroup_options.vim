augroup DemoGroup
  autocmd!
  autocmd BufWritePre *.txt echo 'about to write'
  autocmd FileType python setlocal shiftwidth=4 expandtab
  autocmd BufEnter * let b:entered = get(b:, 'entered', 0) + 1
augroup END
echo exists('#DemoGroup#BufEnter') exists('#DemoGroup')
set number relativenumber
set ignorecase smartcase
set tabstop=4 shiftwidth=4 expandtab
echo &tabstop &shiftwidth &expandtab &ignorecase
setlocal textwidth=80
echo &l:textwidth &g:textwidth
let &tabstop = 8
echo &tabstop
set wildignore+=*.o,*.pyc
echo split(&wildignore, ',')
set listchars=tab:>-,trail:.
echo &listchars
let saved = &laststatus
set laststatus=2
let &laststatus = saved
augroup DemoGroup | autocmd! | augroup END
augroup! DemoGroup
echo exists('#DemoGroup')
echo has('patch-8.0.0') has('nvim') has('unix') has('win32')
