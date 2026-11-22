# Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
$r = [long]0
$out = 1..8 | ForEach-Object { $script:r = $script:r * 10 + 1; $script:r }
$out -join ' '
