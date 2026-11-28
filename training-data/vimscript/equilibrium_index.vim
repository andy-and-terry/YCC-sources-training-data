function! EquilibriumIndex(nums) abort
  let total = 0
  for v in a:nums | let total += v | endfor
  let left = 0
  let i = 0
  for v in a:nums
    if left == total - left - v
      return i
    endif
    let left += v
    let i += 1
  endfor
  return -1
endfunction

echo EquilibriumIndex([1, 7, 3, 6, 5, 6])  " 3
