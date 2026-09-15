function! QuickSort(items)
  if len(a:items) <= 1
    return a:items
  endif
  let pivot = a:items[0]
  let rest = a:items[1:]
  let less = filter(copy(rest), 'v:val < pivot')
  let more = filter(copy(rest), 'v:val >= pivot')
  return QuickSort(less) + [pivot] + QuickSort(more)
endfunction

echo QuickSort([5, 2, 9, 1, 5, 6, 3])
