# Hexagonal numbers: n(2n-1).
builtins.genList (i: let n = i + 1; in n * (2 * n - 1)) 10
