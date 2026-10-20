new
call setline(1, ['line one', 'line two', 'line three'])
call append(line('$'), 'line four')
echo line('$') getline(2) getline(1, 2)
call setline(2, toupper(getline(2)))
2,3s/line/LINE/
echo getline(1, '$')
normal! gg
echo line('.') col('.')
normal! 2G$
echo col('.') getline('.')
%s/\<\(\w\)/\u\1/g
echo getline(1)
call cursor(1, 6)
echo getline('.')[col('.') - 1]
:3delete
echo line('$')
let @a = 'register content'
echo @a getreg('a')
call setreg('b', ['x', 'y'], 'l')
echo getreg('b')
echo search('four') line('.')
echo line2byte(1) bufname('%') == '' &modified
echo len(filter(range(1, line('$')), 'getline(v:val) =~ "LINE"'))
bwipeout!
