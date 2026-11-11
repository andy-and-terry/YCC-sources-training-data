" Square of the sum minus sum of squares for 1..10 (expect 2640)
let s:xs = range(1, 10)
let s:total = eval(join(s:xs, '+'))
let s:squares = eval(join(map(copy(s:xs), 'v:val * v:val'), '+'))
echo s:total * s:total - s:squares
