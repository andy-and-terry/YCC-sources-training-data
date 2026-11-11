" Count contiguous subarrays whose sum equals k (prefix sums + Dictionary).
function! CountSubarrays(nums, k) abort
  let l:seen = {'0': 1}
  let l:total = 0
  let l:count = 0
  for l:x in a:nums
    let l:total += l:x
    let l:count += get(l:seen, string(l:total - a:k), 0)
    let l:seen[string(l:total)] = get(l:seen, string(l:total), 0) + 1
  endfor
  return l:count
endfunction

echo CountSubarrays([1, 1, 1], 2)
