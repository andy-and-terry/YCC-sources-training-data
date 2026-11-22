# Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
(0..9 | ForEach-Object { [int]($_ * ($_ + 1) / 2) + 1 }) -join ' '
