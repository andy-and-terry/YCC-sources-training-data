function! Hanoi(n, from, to, via, moves)
  if a:n == 0
    return
  endif
  call Hanoi(a:n - 1, a:from, a:via, a:to, a:moves)
  call add(a:moves, a:from . ' -> ' . a:to)
  call Hanoi(a:n - 1, a:via, a:to, a:from, a:moves)
endfunction

let moves = []
call Hanoi(3, 'A', 'C', 'B', moves)
for m in moves
  echo m
endfor
echo len(moves)
