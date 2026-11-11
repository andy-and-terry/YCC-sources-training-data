" Narayana's cows N(n)=N(n-1)+N(n-3)
let s:v = [1, 1, 1]
for s:i in range(3, 9)
  call add(s:v, s:v[s:i - 1] + s:v[s:i - 3])
endfor
echo join(s:v, ' ')
