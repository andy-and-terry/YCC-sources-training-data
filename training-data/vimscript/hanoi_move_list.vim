function! Hanoi(n, a, b, c) abort
  if a:n == 0 | return [] | endif
  return Hanoi(a:n - 1, a:a, a:c, a:b) + [a:a . '->' . a:c] + Hanoi(a:n - 1, a:b, a:a, a:c)
endfunction

let moves = Hanoi(3, 'A', 'B', 'C')
echo len(moves) . ': ' . join(moves, ' ')
