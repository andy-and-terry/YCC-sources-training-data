set encoding=utf-8
scriptencoding utf-8

let s = 'naïve café'

echo strlen(s)
echo strchars(s)
echo strdisplaywidth(s)

echo strcharpart(s, 0, 5)
echo byteidx(s, 3)
echo charidx(s, 4)

echo char2nr('é')
echo nr2char(233)
echo toupper(s)
echo split(s, '\zs')[2]
