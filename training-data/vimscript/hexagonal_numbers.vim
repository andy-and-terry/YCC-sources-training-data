" Hexagonal numbers: n(2n-1).
echo join(map(range(1, 10), 'v:val * (2 * v:val - 1)'), ' ')
