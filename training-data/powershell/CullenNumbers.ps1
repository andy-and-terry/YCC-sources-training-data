# Cullen numbers: C(n) = n * 2^n + 1
$result = foreach ($n in 0..9) {
    [long]$n * ([long]1 -shl $n) + 1
}
Write-Output ($result -join ' ')
