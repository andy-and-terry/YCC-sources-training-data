" Lattice paths with a DP list.
function! Lattice(n) abort
  let row = repeat([1], a:n + 1)
  for k in range(a:n)
    for j in range(1, a:n)
      let row[j] += row[j - 1]
    endfor
  endfor
  return row[a:n]
endfunction
echo Lattice(3)
