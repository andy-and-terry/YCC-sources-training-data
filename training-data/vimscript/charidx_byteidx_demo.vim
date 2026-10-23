" byte offsets and character offsets differ for multibyte text
let s:text = 'aé日b'

echo strlen(s:text)
echo strchars(s:text)

echo byteidx(s:text, 0)
echo byteidx(s:text, 1)
echo byteidx(s:text, 2)
echo byteidx(s:text, 3)

echo charidx(s:text, 3)
echo strcharpart(s:text, 2, 1)
echo strpart(s:text, 0, 3)
echo split(s:text, '\zs')
