# Centered square numbers: n^2 + (n+1)^2.
(0..9 | ForEach-Object { $_ * $_ + ($_ + 1) * ($_ + 1) }) -join ' '
