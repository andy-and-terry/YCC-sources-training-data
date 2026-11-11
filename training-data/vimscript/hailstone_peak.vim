" Highest value reached by the Collatz (hailstone) sequence from n.
function! Peak(n) abort
  let l:n = a:n
  let l:best = l:n
  while l:n != 1
    let l:n = l:n % 2 == 0 ? l:n / 2 : 3 * l:n + 1
    let l:best = max([l:best, l:n])
  endwhile
  return l:best
endfunction

echo Peak(27)
