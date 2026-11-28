function! Area(pts) abort
  let n = len(a:pts)
  let s = 0
  for i in range(n)
    let [x1, y1] = a:pts[i]
    let [x2, y2] = a:pts[(i + 1) % n]
    let s += x1 * y2 - x2 * y1
  endfor
  return abs(s) / 2.0
endfunction

echo Area([[0, 0], [4, 0], [4, 3], [0, 3]])
