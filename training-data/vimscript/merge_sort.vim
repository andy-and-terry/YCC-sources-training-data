function! MergeLists(left, right)
  let result = []
  let i = 0
  let j = 0
  while i < len(a:left) && j < len(a:right)
    if a:left[i] <= a:right[j]
      call add(result, a:left[i])
      let i += 1
    else
      call add(result, a:right[j])
      let j += 1
    endif
  endwhile
  return result + a:left[i:] + a:right[j:]
endfunction

function! MergeSort(items)
  if len(a:items) <= 1
    return a:items
  endif
  let mid = len(a:items) / 2
  let left = MergeSort(a:items[0:mid - 1])
  let right = MergeSort(a:items[mid:])
  return MergeLists(left, right)
endfunction

echo MergeSort([5, 2, 9, 1, 5, 6])
