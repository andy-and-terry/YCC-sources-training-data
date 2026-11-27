function! Lah(n, k) abort
  let c = 1
  let f = 1
  for i in range(a:k - 1)
    let c = c * (a:n - 1 - i) / (i + 1)
  endfor
  for i in range(a:k + 1, a:n)
    let f = f * i
  endfor
  return c * f
endfunction

for n in range(1, 5)
  echo join(map(range(1, n), 'Lah(n, v:val)'), ' ')
endfor
