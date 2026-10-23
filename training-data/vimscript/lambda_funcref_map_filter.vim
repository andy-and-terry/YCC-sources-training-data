let nums = range(1, 8)
let evens = filter(copy(nums), {_, v -> v % 2 == 0})
let squares = map(copy(evens), {_, v -> v * v})
let Add = {a, b -> a + b}
let total = reduce(squares, Add, 0)
echo evens
echo squares
echo total
