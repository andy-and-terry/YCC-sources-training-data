" Bead (gravity) sort.
function! BeadSort(nums) abort
  let cols = map(range(1, max(a:nums)), {_, i -> len(filter(copy(a:nums), {_, n -> n >= i}))})
  let rows = map(range(1, len(a:nums)), {_, r -> len(filter(copy(cols), {_, c -> c >= r}))})
  return reverse(rows)
endfunction
echo BeadSort([5, 3, 1, 4, 2])
