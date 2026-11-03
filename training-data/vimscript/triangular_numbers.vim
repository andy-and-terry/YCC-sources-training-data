let s:sum = 0
let s:tri = []
for s:n in range(1, 10)
  let s:sum += s:n
  call add(s:tri, s:sum)
endfor
echo s:tri
