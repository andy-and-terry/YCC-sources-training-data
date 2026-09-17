function! QuickSort(arr)
  if len(a:arr) <= 1
    return a:arr
  endif
  let pivot = a:arr[0]
  let rest = a:arr[1:]
  let less = filter(copy(rest), 'v:val < pivot')
  let more = filter(copy(rest), 'v:val >= pivot')
  return QuickSort(less) + [pivot] + QuickSort(more)
endfunction

echo QuickSort([5, 3, 8, 1, 9, 2])
