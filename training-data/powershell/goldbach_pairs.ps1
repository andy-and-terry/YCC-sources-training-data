# Goldbach partitions of 100; expect 6.
function Test-Prime([int]$n) {
    if ($n -lt 2) { return $false }
    for ($d = 2; $d * $d -le $n; $d++) { if ($n % $d -eq 0) { return $false } }
    return $true
}

$pairs = 2..50 | Where-Object { (Test-Prime $_) -and (Test-Prime (100 - $_)) } | ForEach-Object { "$_+$(100 - $_)" }
"$($pairs.Count): $($pairs -join ' ')"
