function! Quicksort(items)
  if len(a:items) <= 1
    return a:items
  endif
  let pivot = a:items[0]
  let rest = a:items[1:]
  let less = filter(copy(rest), 'v:val < pivot')
  let more = filter(copy(rest), 'v:val >= pivot')
  return Quicksort(less) + [pivot] + Quicksort(more)
endfunction

echo Quicksort([5, 3, 8, 1, 9, 2, 7])
