function! BubbleSort(items)
  let arr = copy(a:items)
  let n = len(arr)
  for i in range(n)
    for j in range(n - i - 1)
      if arr[j] > arr[j + 1]
        let temp = arr[j]
        let arr[j] = arr[j + 1]
        let arr[j + 1] = temp
      endif
    endfor
  endfor
  return arr
endfunction

echo BubbleSort([5, 2, 9, 1, 5, 6])
