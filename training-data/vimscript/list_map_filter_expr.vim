let xs = range(1, 10)
echo filter(copy(xs), 'v:val % 2 == 0')
echo map(copy(xs), {_, v -> v * v})
echo reduce(xs, {acc, v -> acc + v}, 0)
