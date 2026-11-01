let s = 'Hello, Vim'
echo toupper(s) len(s) s[0:4]
echo substitute(s, 'Vim', 'World', '')
echo split('a,b,c', ',')
echo printf('%05.1f|%-4s|%x', 3.14159, 'ab', 255)
echo stridx(s, 'Vim') matchstr(s, '\a\+$')
