# Hexagonal numbers: n(2n-1).
(1..10 | ForEach-Object { $_ * (2 * $_ - 1) }) -join ' '
