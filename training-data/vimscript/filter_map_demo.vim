let nums = range(1, 10)

echo filter(copy(nums), 'v:val % 2 == 0')
echo map(copy(nums), 'v:val * v:val')
echo filter(copy(nums), {_, v -> v > 7})
echo map(copy(nums), {i, v -> i * v})

let words = ['apple', 'Banana', 'cherry', 'avocado']
echo filter(copy(words), 'v:val =~? "^a"')
echo map(copy(words), 'toupper(v:val[0]) . v:val[1:]')

let d = {'a': 1, 'b': 2, 'c': 3}
echo filter(copy(d), {k, v -> v >= 2})
echo map(copy(d), {k, v -> v * 10})

echo eval(join(nums, '+'))
echo join(map(copy(nums[:2]), 'string(v:val)'), '+')
