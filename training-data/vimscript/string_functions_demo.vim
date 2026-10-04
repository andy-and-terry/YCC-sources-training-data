let s = 'Hello, Vim World'

echo len(s)
echo toupper(s) . ' / ' . tolower(s)
echo strpart(s, 7, 3)
echo s[7:9]
echo stridx(s, 'Vim')
echo strridx(s, 'o')
echo substitute(s, 'o', '0', 'g')
echo trim('   padded   ')
echo split('a,b,,c', ',')
echo split('a,b,,c', ',', 1)
echo join(['x', 'y', 'z'], '-')
echo repeat('=', 10)
echo s =~# 'vim'
echo s =~? 'vim'
echo strlen('héllo') strchars('héllo')
echo tr('hello', 'el', 'ip')
echo escape('a.b*c', '.*')
echo char2nr('A') nr2char(97)
echo string(1.5) . ' ' . string('quote''s')
