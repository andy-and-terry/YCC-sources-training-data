let s = 'Hello, World'
echo len(s) toupper(s) tolower(s) strpart(s, 7) s[0:4] s[-5:]
echo substitute(s, 'l', 'L', 'g') substitute(s, '\(\w\+\), \(\w\+\)', '\2 \1', '')
echo split('a,b,,c', ',') split('a,b,,c', ',', 1) split('one  two')
echo join(['x', 'y'], '-') repeat('ab', 3) trim('  pad  ') . '|'
echo stridx(s, 'o') strridx(s, 'o') s =~ 'World' s =~# 'world' s =~? 'world'
echo matchstr('tel 555-1234', '\d\+-\d\+') match('abc123', '\d') matchend('abc123', '\a\+')
echo matchlist('2024-03-05', '\(\d\+\)-\(\d\+\)-\(\d\+\)')[1:3]
echo printf('%05.1f|%-5s|%3d|%x|%s', 3.14159, 'ab', 7, 255, [1, 2])
echo string(42) str2nr('ff', 16) str2float('2.5') + 1 nr2char(65) char2nr('a')
echo escape('a.b*c', '.*') fnamemodify('/a/b/c.txt', ':t:r') fnamemodify('/a/b/c.txt', ':h') expand('%:p') == ''
echo toupper(s[0]) . tolower(s[1:]) tr('abc', 'ab', 'xy') strlen('héllo') strchars('héllo') strdisplaywidth('abc')
echo 'abc' < 'abd' 'a' ==# 'A' 'a' ==? 'A' "tab\there" 'it''s'
