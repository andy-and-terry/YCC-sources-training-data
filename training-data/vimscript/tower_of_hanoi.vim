let g:moves = []

function! Hanoi(n, from, to, via)
  if a:n == 0
    return
  endif
  call Hanoi(a:n - 1, a:from, a:via, a:to)
  call add(g:moves, a:from . '->' . a:to)
  call Hanoi(a:n - 1, a:via, a:to, a:from)
endfunction

call Hanoi(3, 'A', 'C', 'B')
echo g:moves
echo len(g:moves)
