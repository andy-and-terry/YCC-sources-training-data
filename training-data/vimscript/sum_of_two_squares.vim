" Positive n expressible as a*a + b*b with a, b >= 0.
function! Representable(n)
  let l:a = 0
  while l:a * l:a <= a:n
    let l:b = l:a
    while l:a * l:a + l:b * l:b <= a:n
      if l:a * l:a + l:b * l:b == a:n
        return 1
      endif
      let l:b += 1
    endwhile
    let l:a += 1
  endwhile
  return 0
endfunction

echo join(filter(range(1, 30), 'Representable(v:val)'), ' ')
