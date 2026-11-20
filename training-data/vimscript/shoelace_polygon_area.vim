" Shoelace polygon area.
let s:pts = [[0, 0], [4, 0], [4, 3], [0, 3]]
let s:sum = 0
for i in range(len(s:pts))
  let q = s:pts[(i + 1) % len(s:pts)]
  let s:sum += s:pts[i][0] * q[1] - q[0] * s:pts[i][1]
endfor
echo abs(s:sum) / 2.0
