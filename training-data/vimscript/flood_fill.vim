function! FloodFill(image, row, col, new)
  let old = a:image[a:row][a:col]
  if old == a:new
    return a:image
  endif
  let rows = len(a:image)
  let cols = len(a:image[0])
  let stack = [[a:row, a:col]]

  while !empty(stack)
    let [r, c] = remove(stack, -1)
    if r < 0 || r >= rows || c < 0 || c >= cols
      continue
    endif
    if a:image[r][c] != old
      continue
    endif
    let a:image[r][c] = a:new
    call extend(stack, [[r + 1, c], [r - 1, c], [r, c + 1], [r, c - 1]])
  endwhile
  return a:image
endfunction

let img = [[1, 1, 0], [1, 0, 0], [1, 1, 1]]
for line in FloodFill(img, 0, 0, 7)
  echo line
endfor
