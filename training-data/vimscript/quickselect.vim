" Quickselect: find the k-th smallest element (0-indexed) without a full sort.
function! Partition(arr, low, high)
  let pivot = a:arr[a:high]
  let i = a:low - 1
  for j in range(a:low, a:high - 1)
    if a:arr[j] <= pivot
      let i += 1
      let tmp = a:arr[i]
      let a:arr[i] = a:arr[j]
      let a:arr[j] = tmp
    endif
  endfor
  let tmp = a:arr[i + 1]
  let a:arr[i + 1] = a:arr[a:high]
  let a:arr[a:high] = tmp
  return i + 1
endfunction

function! Quickselect(arr, low, high, k)
  if a:low == a:high
    return a:arr[a:low]
  endif
  let pivotIndex = Partition(a:arr, a:low, a:high)
  if a:k == pivotIndex
    return a:arr[a:k]
  elseif a:k < pivotIndex
    return Quickselect(a:arr, a:low, pivotIndex - 1, a:k)
  else
    return Quickselect(a:arr, pivotIndex + 1, a:high, a:k)
  endif
endfunction

let nums = [7, 2, 9, 4, 1, 8, 3]
echo Quickselect(copy(nums), 0, len(nums) - 1, 2)
echo Quickselect(copy(nums), 0, len(nums) - 1, 0)
echo Quickselect(copy(nums), 0, len(nums) - 1, len(nums) - 1)
