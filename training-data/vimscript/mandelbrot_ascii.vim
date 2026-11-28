function! Escape(cr, ci) abort
  let zr = 0.0
  let zi = 0.0
  for n in range(30)
    if zr * zr + zi * zi >= 4.0
      return n
    endif
    let t = zr * zr - zi * zi + a:cr
    let zi = 2.0 * zr * zi + a:ci
    let zr = t
  endfor
  return 30
endfunction

for yi in range(-5, 5)
  let line = ''
  for xi in range(-40, 12)
    let line .= Escape(xi / 20.0, yi / 5.0) == 30 ? '#' : '.'
  endfor
  echo line
endfor
