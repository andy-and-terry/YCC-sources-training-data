function! SelectionSort(items)
  let arr = copy(a:items)
  let n = len(arr)
  for i in range(n - 1)
    let minIdx = i
    for j in range(i + 1, n - 1)
      if arr[j] < arr[minIdx]
        let minIdx = j
      endif
    endfor
    let temp = arr[i]
    let arr[i] = arr[minIdx]
    let arr[minIdx] = temp
  endfor
  return arr
endfunction

echo SelectionSort([5, 3, 8, 1, 9, 2])
