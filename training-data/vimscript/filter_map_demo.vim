let nums = range(1, 10)
let evens = filter(copy(nums), 'v:val % 2 == 0')
let squares = map(copy(nums), {_, v -> v * v})
let big = filter(copy(squares), {_, v -> v > 20})

echo evens
echo squares
echo big

let words = ['apple', 'Banana', 'cherry']
echo map(copy(words), {_, w -> toupper(w[0]) . w[1:]})
echo filter(copy(words), {_, w -> w =~# '^[a-z]'})

let ages = {'ann': 31, 'bob': 17, 'cy': 45}
let adults = filter(copy(ages), {_, a -> a >= 18})
echo sort(keys(adults))
echo map(copy(ages), {k, v -> k . ':' . v})['bob']
