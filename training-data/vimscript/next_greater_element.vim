" Monotonic-stack next-greater-element: for each index, the next value to its
" right that is strictly greater, or -1 if none exists.
function! NextGreaterElements(nums)
  let n = len(a:nums)
  let result = repeat([-1], n)
  let stack = []
  let i = 0
  while i < n
    while !empty(stack) && a:nums[stack[-1]] < a:nums[i]
      let idx = remove(stack, len(stack) - 1)
      let result[idx] = a:nums[i]
    endwhile
    call add(stack, i)
    let i += 1
  endwhile
  return result
endfunction

echo NextGreaterElements([2, 1, 2, 4, 3])
echo NextGreaterElements([5, 4, 3, 2, 1])
