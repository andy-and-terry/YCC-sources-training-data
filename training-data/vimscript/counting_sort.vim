function! CountingSort(arr)
  if empty(a:arr)
    return []
  endif
  let maxVal = max(a:arr)
  let counts = repeat([0], maxVal + 1)
  for x in a:arr
    let counts[x] += 1
  endfor
  let result = []
  for i in range(0, maxVal)
    let j = 0
    while j < counts[i]
      call add(result, i)
      let j += 1
    endwhile
  endfor
  return result
endfunction

echo CountingSort([4, 2, 2, 8, 3, 3, 1])
