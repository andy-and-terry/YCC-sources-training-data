function! BinarySearch(arr, low, high, target)
  if a:low > a:high
    return -1
  endif
  let mid = (a:low + a:high) / 2
  if a:arr[mid] == a:target
    return mid
  elseif a:arr[mid] < a:target
    return BinarySearch(a:arr, mid + 1, a:high, a:target)
  else
    return BinarySearch(a:arr, a:low, mid - 1, a:target)
  endif
endfunction

echo BinarySearch([1, 3, 5, 7, 9, 11], 0, 5, 7)
