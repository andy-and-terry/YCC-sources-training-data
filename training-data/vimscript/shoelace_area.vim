function! Shoelace(pts) abort
  let n = len(a:pts)
  let s = 0.0
  for i in range(n)
    let p = a:pts[i]
    let q = a:pts[(i + 1) % n]
    let s += p[0] * q[1] - q[0] * p[1]
  endfor
  return abs(s) / 2
endfunction

echo Shoelace([[0, 0], [4, 0], [4, 3], [0, 3]])
