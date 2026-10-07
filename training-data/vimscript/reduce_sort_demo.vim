let numbers = [5, 2, 9, 1, 5, 6]

let total = reduce(numbers, {acc, v -> acc + v}, 0)
let maximum = reduce(numbers, {acc, v -> v > acc ? v : acc}, numbers[0])

function! DescendingCompare(a, b)
  return a:b - a:a
endfunction

let descending = sort(copy(numbers), 'DescendingCompare')

echo total
echo maximum
echo descending
