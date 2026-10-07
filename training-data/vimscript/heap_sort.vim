function! Heapify(arr, n, i)
  let largest = a:i
  let left = 2 * a:i + 1
  let right = 2 * a:i + 2
  if left < a:n && a:arr[left] > a:arr[largest]
    let largest = left
  endif
  if right < a:n && a:arr[right] > a:arr[largest]
    let largest = right
  endif
  if largest != a:i
    let tmp = a:arr[a:i]
    let a:arr[a:i] = a:arr[largest]
    let a:arr[largest] = tmp
    call Heapify(a:arr, a:n, largest)
  endif
endfunction

function! HeapSort(arr)
  let n = len(a:arr)
  for i in range(n / 2 - 1, 0, -1)
    call Heapify(a:arr, n, i)
  endfor
  for i in range(n - 1, 1, -1)
    let tmp = a:arr[0]
    let a:arr[0] = a:arr[i]
    let a:arr[i] = tmp
    call Heapify(a:arr, i, 0)
  endfor
  return a:arr
endfunction

echo HeapSort([5, 2, 9, 1, 5, 6])
