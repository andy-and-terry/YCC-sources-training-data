function! PairWithSum(sorted, target)
  let left = 0
  let right = len(a:sorted) - 1
  while left < right
    let sum = a:sorted[left] + a:sorted[right]
    if sum == a:target
      return [a:sorted[left], a:sorted[right]]
    elseif sum < a:target
      let left += 1
    else
      let right -= 1
    endif
  endwhile
  return []
endfunction

let data = [1, 3, 4, 6, 8, 11]
echo PairWithSum(data, 10)
echo PairWithSum(data, 100)
