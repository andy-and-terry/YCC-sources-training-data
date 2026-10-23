function! PythagoreanTriples(limit) abort
  let result = []
  for a in range(1, a:limit - 1)
    for b in range(a, a:limit - 1)
      let c = float2nr(sqrt(a * a + b * b))
      if c <= a:limit && c * c == a * a + b * b
        call add(result, [a, b, c])
      endif
    endfor
  endfor
  return result
endfunction

for [a, b, c] in PythagoreanTriples(20)
  echo printf('%d^2 + %d^2 = %d^2', a, b, c)
endfor
