new
call setline(1, 'The quick brown fox jumps')
normal! gg0
normal! wd2w
echo getline(1)
normal! u
echo getline(1)
normal! 0ciwA
echo getline(1)
normal! $x
normal! 0yw$p
echo getline(1)
call setline(1, ['a', 'b', 'c', 'd'])
normal! ggddjp
echo getline(1, '$')
normal! G
execute 'normal! kdd'
echo getline(1, '$')
execute "normal! ggO\<Esc>"
echo line('$')
%normal! Aend
echo getline(2)
global/^$/delete
echo line('$')
g/e/normal! Ax
echo getline(1, '$')
v/x$/s/$/!/
echo getline(1, '$')
sort! 
echo getline(1)
bwipeout!
