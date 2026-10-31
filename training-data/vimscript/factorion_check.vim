let s:fact = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]

function! IsFactorion(n)
  let sum = 0
  for ch in split(string(a:n), '\zs')
    let sum += s:fact[str2nr(ch)]
  endfor
  return sum == a:n
endfunction

echo filter(range(1, 49999), 'IsFactorion(v:val)')
