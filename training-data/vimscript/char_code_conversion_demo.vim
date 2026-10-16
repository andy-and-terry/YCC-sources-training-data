" Converting between characters and code points.
echo char2nr('A')
echo nr2char(97)
echo char2nr('é')
echo nr2char(0x263A)
let s:word = 'Vim'
let s:codes = map(split(s:word, '\zs'), 'char2nr(v:val)')
echo s:codes
echo join(map(copy(s:codes), 'nr2char(v:val + 1)'), '')
echo printf('%x', char2nr('z'))
