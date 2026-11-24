" Pentagonal numbers: n(3n-1)/2.
echo join(map(range(1, 10), 'v:val * (3 * v:val - 1) / 2'), ' ')
