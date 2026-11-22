" Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
function! Fact(n)
  let l:f = 1
  if a:n < 2
    return l:f
  endif
  for l:i in range(2, a:n)
    let l:f = l:f * l:i
  endfor
  return l:f
endfunction

function! Comb(n, k)
  return Fact(a:n) / (Fact(a:k) * Fact(a:n - a:k))
endfunction

let s:n = 5
let s:out = []
for s:k in range(1, s:n)
  call add(s:out, Comb(s:n - 1, s:k - 1) * Fact(s:n) / Fact(s:k))
endfor
echo join(s:out, ' ')
