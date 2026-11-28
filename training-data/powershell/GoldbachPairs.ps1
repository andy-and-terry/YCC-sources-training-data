function Test-Prime([int]$N) {
    if ($N -lt 2) { return $false }
    for ($d = 2; $d * $d -le $N; $d++) { if ($N % $d -eq 0) { return $false } }
    $true
}

$n = 28
2..($n / 2) | Where-Object { (Test-Prime $_) -and (Test-Prime ($n - $_)) } |
    ForEach-Object { "$_ + $($n - $_)" }
