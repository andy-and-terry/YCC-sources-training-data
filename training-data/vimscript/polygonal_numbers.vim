function! Polygonal(s, n)
  return ((a:s - 2) * a:n * a:n - (a:s - 4) * a:n) / 2
endfunction

function! FirstTen(s)
  return map(range(1, 10), 'Polygonal(a:s, v:val)')
endfunction

echo 'triangular: ' . join(FirstTen(3), ' ')
echo 'pentagonal: ' . join(FirstTen(5), ' ')
echo 'hexagonal: ' . join(FirstTen(6), ' ')
