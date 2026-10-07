let nums = [1, 2, 3, 4, 5, 6]

let doubled = map(copy(nums), 'v:val * 2')
echo doubled

let evens = filter(copy(nums), 'v:val % 2 == 0')
echo evens

let labels = map(copy(nums), {idx, val -> idx . ':' . val})
echo labels

let squares = map(range(1, 5), {_, v -> v * v})
echo squares

call filter(nums, {_, v -> v > 2})
echo nums

let words = ['apple', 'Banana', 'cherry']
echo map(copy(words), {_, w -> toupper(w[0]) . w[1:]})
echo filter(copy(words), 'v:val =~# "^[a-z]"')

let scores = {'ann': 90, 'bob': 60, 'cy': 75}
let passing = filter(copy(scores), {_, v -> v >= 70})
echo sort(keys(passing))
echo map(copy(scores), {k, v -> v + 5})

echo mapnew([1, 2, 3], {_, v -> v * 10})
echo reduce([1, 2, 3, 4], {acc, v -> acc + v}, 0)
echo join(map(range(3), 'string(v:val)'), '-')
