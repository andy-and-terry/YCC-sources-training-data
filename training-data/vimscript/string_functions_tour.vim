let s = 'Hello, Vim'
echo len(s) toupper(s) s[0:4]
echo substitute(s, 'Vim', 'Vimscript', '')
echo split('a,b,c', ',') join(['x', 'y'], '-')
echo printf('%05.1f|%-4s|', 3.14159, 'ab')
