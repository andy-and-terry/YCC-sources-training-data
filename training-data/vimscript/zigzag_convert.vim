function! Zigzag(s, rows) abort
  if a:rows == 1 || a:rows >= strlen(a:s)
    return a:s
  endif
  let lines = repeat([''], a:rows)
  let r = 0
  let step = 1
  for c in split(a:s, '\zs')
    let lines[r] .= c
    if r == 0
      let step = 1
    elseif r == a:rows - 1
      let step = -1
    endif
    let r += step
  endfor
  return join(lines, '')
endfunction

echo Zigzag('PAYPALISHIRING', 3)
