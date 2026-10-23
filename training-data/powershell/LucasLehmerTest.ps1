function Test-Prime {
    param([int]$N)

    if ($N -lt 2) { return $false }
    for ($d = 2; $d * $d -le $N; $d++) {
        if ($N % $d -eq 0) { return $false }
    }
    return $true
}

function Test-LucasLehmer {
    param([int]$P)

    if ($P -eq 2) { return $true }
    $m = ([long]1 -shl $P) - 1
    $s = [long]4
    for ($i = 0; $i -lt $P - 2; $i++) {
        $s = ($s * $s - 2) % $m
    }
    return ($s -eq 0)
}

$result = foreach ($p in 2..19) {
    if ((Test-Prime $p) -and (Test-LucasLehmer $p)) { $p }
}
Write-Output ($result -join ' ')
