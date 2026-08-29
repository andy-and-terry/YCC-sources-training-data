function! IsSafe(queens, col)
  let n = len(a:queens)
  for i in range(n)
    let dist = n - i
    if a:queens[i] == a:col || abs(a:queens[i] - a:col) == dist
      return 0
    endif
  endfor
  return 1
endfunction

function! Solve(queens, n)
  if len(a:queens) == a:n
    return 1
  endif
  let total = 0
  for col in range(a:n)
    if IsSafe(a:queens, col)
      let total += Solve(a:queens + [col], a:n)
    endif
  endfor
  return total
endfunction

echo Solve([], 6)
