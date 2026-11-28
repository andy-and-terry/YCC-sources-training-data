function! MaxArea(h) abort
  let lo = 0
  let hi = len(a:h) - 1
  let best = 0
  while lo < hi
    let best = max([best, min([a:h[lo], a:h[hi]]) * (hi - lo)])
    if a:h[lo] < a:h[hi] | let lo += 1 | else | let hi -= 1 | endif
  endwhile
  return best
endfunction

echo MaxArea([1, 8, 6, 2, 5, 4, 8, 3, 7])  " 49
