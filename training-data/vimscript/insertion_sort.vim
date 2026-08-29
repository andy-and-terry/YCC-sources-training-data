function! InsertionSort(items)
  let arr = copy(a:items)
  for i in range(1, len(arr) - 1)
    let key = arr[i]
    let j = i - 1
    while j >= 0 && arr[j] > key
      let arr[j + 1] = arr[j]
      let j -= 1
    endwhile
    let arr[j + 1] = key
  endfor
  return arr
endfunction

echo InsertionSort([12, 11, 13, 5, 6])
