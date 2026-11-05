let nums = range(1, 8)
echo filter(copy(nums), 'v:val % 2 == 0')
echo map(copy(nums), {_, v -> v * v})
echo sort([3, 1, 2], {a, b -> b - a})
let d = {'a': 1, 'b': 2}
echo keys(d) values(d)
