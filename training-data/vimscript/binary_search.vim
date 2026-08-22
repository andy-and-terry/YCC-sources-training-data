function! BinarySearch(arr, target)
  let low = 0
  let high = len(a:arr) - 1
  while low <= high
    let mid = (low + high) / 2
    if a:arr[mid] == a:target
      return mid
    elseif a:arr[mid] < a:target
      let low = mid + 1
    else
      let high = mid - 1
    endif
  endwhile
  return -1
endfunction

echo BinarySearch([1, 3, 5, 7, 9, 11, 13], 7)
echo BinarySearch([1, 3, 5, 7, 9, 11, 13], 4)
