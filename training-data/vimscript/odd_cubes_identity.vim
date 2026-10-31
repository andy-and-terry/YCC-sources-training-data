function! CubeFromOdds(n)
  let start = a:n * a:n - a:n + 1
  let sum = 0
  for i in range(a:n)
    let sum += start + 2 * i
  endfor
  return sum
endfunction

for n in range(1, 5)
  echo n CubeFromOdds(n) (CubeFromOdds(n) == n * n * n)
endfor
