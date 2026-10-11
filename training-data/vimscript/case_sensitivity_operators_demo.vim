" Comparison operator case suffixes: # match case, ? ignore case.
set ignorecase
echo 'Vim' ==  'vim'
echo 'Vim' ==# 'vim'
echo 'Vim' ==? 'VIM'
echo 'abc' =~  'B'
echo 'abc' =~# 'B'
echo 'abc' =~? 'B'
echo 'a' <# 'B'
echo 'a' <? 'B'
set noignorecase
