call setline(1, ['alpha', 'beta', 'gamma'])

call setreg('a', 'hello from register a')
echo getreg('a')

normal! yy
echo getreg('"')

call setreg('b', ['one', 'two'], 'l')
normal! "bp

echo getline(1, '$')
