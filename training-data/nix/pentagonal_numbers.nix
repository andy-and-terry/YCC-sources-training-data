# Pentagonal numbers: n(3n-1)/2.
builtins.genList (i: let n = i + 1; in n * (3 * n - 1) / 2) 10
