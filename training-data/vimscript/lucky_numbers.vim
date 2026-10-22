function! Lucky(limit)
  let nums = range(1, a:limit, 2)
  let idx = 1
  while idx < len(nums) && nums[idx] <= len(nums)
    let step = nums[idx]
    let kept = []
    for j in range(len(nums))
      if (j + 1) % step != 0
        call add(kept, nums[j])
      endif
    endfor
    let nums = kept
    let idx += 1
  endwhile
  return nums
endfunction

echo join(Lucky(50), ' ')
