function! SpiralOrder(matrix)
  let result = []
  if empty(a:matrix)
    return result
  endif
  let top = 0
  let bottom = len(a:matrix) - 1
  let left = 0
  let right = len(a:matrix[0]) - 1
  while top <= bottom && left <= right
    for c in range(left, right)
      call add(result, a:matrix[top][c])
    endfor
    let top += 1
    for r in range(top, bottom)
      call add(result, a:matrix[r][right])
    endfor
    let right -= 1
    if top <= bottom
      for c in range(right, left, -1)
        call add(result, a:matrix[bottom][c])
      endfor
      let bottom -= 1
    endif
    if left <= right
      for r in range(bottom, top, -1)
        call add(result, a:matrix[r][left])
      endfor
      let left += 1
    endif
  endwhile
  return result
endfunction

echo SpiralOrder([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
