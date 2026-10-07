let nums = [10, 9, 2, 33, 9, 2, 100, 1]

" Default sort is lexicographic; 'n' sorts numerically
echo sort(copy(nums))
echo sort(copy(nums), 'n')

" uniq() removes only adjacent duplicates, so sort first
echo uniq(sort(copy(nums), 'n'))

" Reverse numeric sort with a comparator
function! Descending(a, b)
  return a:b - a:a
endfunction
echo sort(copy(nums), 'Descending')
