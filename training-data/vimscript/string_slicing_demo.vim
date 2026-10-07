let s = 'Hello, Vim!'

echo s[0]
echo s[7:9]
echo s[7:]
echo s[:4]
echo s[-4:]
echo s[-4:-2]
echo s[3:1]
echo strpart(s, 7, 3)
echo strpart(s, 7)
echo strcharpart('héllo', 1, 3)
echo len('héllo') . ' ' . strchars('héllo') . ' ' . strwidth('héllo')
echo substitute(s, 'Vim', 'Vi', '')
echo toupper(s) . ' ' . tolower(s)
echo stridx(s, 'o') . ' ' . strridx(s, 'o') . ' ' . stridx(s, 'zzz')
echo s =~# 'vim'
echo s =~? 'vim'
echo matchstr(s, '\a\+', 0, 2)
echo repeat('ab', 3)
echo join(reverse(split(s, '\zs')), '')
echo trim('  padded  ') . '|'
echo trim('xxhixx', 'x')
echo escape('a.b*c', '.*')
echo tr('hello', 'el', 'ip')
echo substitute('a b  c', '\s\+', '_', 'g')
echo strtrans("tab\there")
echo split('a,b,,c', ',')
echo split('a,b,,c', ',', 1)
echo len(split('', ','))
echo 'abc' < 'abd'
echo 'abc' . 'def'
echo char2nr('A') . ' ' . nr2char(97)
echo printf('%s', s[1 : 3])
