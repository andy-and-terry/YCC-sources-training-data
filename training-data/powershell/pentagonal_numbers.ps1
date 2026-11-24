# Pentagonal numbers: n(3n-1)/2.
(1..10 | ForEach-Object { $_ * (3 * $_ - 1) / 2 }) -join ' '
