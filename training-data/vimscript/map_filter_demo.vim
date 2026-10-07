let nums = range(1, 10)

" map() and filter() modify in place, so copy() first
let squares = map(copy(nums), 'v:val * v:val')
let evens = filter(copy(nums), 'v:val % 2 == 0')

" Lambda form with index and value
let indexed = map(copy(nums), {i, v -> i . ':' . v})

echo squares
echo evens
echo indexed[0:2]
