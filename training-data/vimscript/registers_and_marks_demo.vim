call setline(1, ['alpha', 'beta', 'gamma'])

call setreg('a', 'hello register')
echo getreg('a')

let @b = 'stored via @ syntax'
echo @b

call setpos("'x", [0, 2, 1, 0])
let pos = getpos("'x")
echo 'mark x at line ' . pos[1] . ', col ' . pos[2]
