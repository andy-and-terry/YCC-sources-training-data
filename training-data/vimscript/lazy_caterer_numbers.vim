" Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
let s:out = []
for s:n in range(10)
  call add(s:out, s:n * (s:n + 1) / 2 + 1)
endfor
echo join(s:out, ' ')
