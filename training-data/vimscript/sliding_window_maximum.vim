function! SlidingWindowMax(nums, k)
  let deque = []
  let result = []
  for i in range(len(a:nums))
    while !empty(deque) && deque[0] <= i - a:k
      call remove(deque, 0)
    endwhile
    while !empty(deque) && a:nums[deque[-1]] <= a:nums[i]
      call remove(deque, len(deque) - 1)
    endwhile
    call add(deque, i)
    if i >= a:k - 1
      call add(result, a:nums[deque[0]])
    endif
  endfor
  return result
endfunction

echo SlidingWindowMax([1, 3, -1, -3, 5, 3, 6, 7], 3)
echo SlidingWindowMax([9, 8, 7, 6], 2)
