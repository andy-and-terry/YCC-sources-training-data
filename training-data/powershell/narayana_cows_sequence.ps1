# Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
$n = @(1, 1, 1)
for ($i = 3; $i -lt 15; $i++) {
    $n += $n[$i - 1] + $n[$i - 3]
}
Write-Output ($n -join ' ')
