let s = 'hello, vim world'
echo stridx(s, 'vim')
echo strridx(s, 'o')
echo strpart(s, 7, 3)
echo s[7:9]
echo strlen(s)
echo toupper(s[0]) . s[1:]
echo trim('   padded  ')
echo repeat('-', 10)
echo substitute(s, 'o', '0', 'g')
echo s =~# 'Vim'
echo s =~? 'Vim'
echo join(reverse(split(s, '\zs')), '')
