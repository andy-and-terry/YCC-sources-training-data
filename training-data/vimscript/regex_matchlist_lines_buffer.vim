let line = 'user=ann id=42'
let m = matchlist(line, 'user=\(\w\+\) id=\(\d\+\)')
echo m[1] m[2]
echo line =~# '^user'
echo line !~? 'ADMIN'
echo stridx(line, 'id')
