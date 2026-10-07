set tabstop=8
echo &tabstop

setlocal tabstop=2
echo &l:tabstop &g:tabstop

let &l:shiftwidth = 4
echo &shiftwidth

let old = &ignorecase
set ignorecase
echo 'Foo' ==# 'foo' 'Foo' ==? 'foo' 'Foo' == 'foo'
let &ignorecase = old

echo exists('&number')
echo exists('&nosuchoption')
echo &filetype == ''

set wildignore+=*.o,*.pyc
echo &wildignore
set wildignore-=*.o
echo &wildignore

new
setlocal buftype=nofile noswapfile
echo &l:buftype
bwipeout!
