" Perrin sequence P(n)=P(n-2)+P(n-3)
let s:v = [3, 0, 2]
for s:i in range(3, 9)
  call add(s:v, s:v[s:i - 2] + s:v[s:i - 3])
endfor
echo join(s:v, ' ')
