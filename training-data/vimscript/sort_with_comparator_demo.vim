function! CompareDesc(a, b)
  return a:b - a:a
endfunction

let nums = [5, 3, 8, 1, 9, 2]
let sorted_asc = sort(copy(nums))
let sorted_desc = sort(copy(nums), 'CompareDesc')

echo sorted_asc
echo sorted_desc

let words = ['banana', 'kiwi', 'apple', 'fig']
let by_length = sort(copy(words), {a, b -> len(a) - len(b)})
echo by_length
