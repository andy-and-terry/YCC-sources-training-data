function Test-Prime([int]$N) {
    if ($N -lt 2) { return $false }
    for ($d = 2; $d * $d -le $N; $d++) { if ($N % $d -eq 0) { return $false } }
    $true
}

3..48 | Where-Object { (Test-Prime $_) -and (Test-Prime ($_ + 2)) } |
    ForEach-Object { "($_, $($_ + 2))" }
