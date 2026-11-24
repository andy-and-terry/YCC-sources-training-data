" Centered square numbers: n^2 + (n+1)^2.
echo join(map(range(0, 9), 'v:val * v:val + (v:val + 1) * (v:val + 1)'), ' ')
