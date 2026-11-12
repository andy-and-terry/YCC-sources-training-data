let xs = range(1, 10)
echo filter(copy(xs), 'v:val % 2 == 0')
echo map(copy(xs), {_, v -> v * v})
let d = {'a': 1, 'b': 2}
for [k, v] in items(d) | echo k . '=' . v | endfor
