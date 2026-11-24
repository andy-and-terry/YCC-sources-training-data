" Fibbinary numbers: no two adjacent 1 bits.
echo join(filter(range(0, 49), 'and(v:val, v:val / 2) == 0'), ' ')
