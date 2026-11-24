# Fibbinary numbers: no two adjacent 1 bits.
(0..49 | Where-Object { ($_ -band ($_ -shr 1)) -eq 0 }) -join ' '
