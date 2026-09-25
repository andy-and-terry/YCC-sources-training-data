function! CountingSort(arr, maxVal)
  let counts = repeat([0], a:maxVal + 1)
  for v in a:arr
    let counts[v] += 1
  endfor
  let result = []
  for v in range(a:maxVal + 1)
    for _ in range(counts[v])
      call add(result, v)
    endfor
  endfor
  return result
endfunction

echo CountingSort([4, 2, 2, 8, 3, 3, 1], 8)
