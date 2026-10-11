function Get-AliquotSum {
    param([int]$N)
    if ($N -lt 2) { return 0 }
    $sum = 1
    for ($d = 2; $d * $d -le $N; $d++) {
        if ($N % $d -eq 0) {
            $sum += $d
            if ($d -ne $N / $d) { $sum += $N / $d }
        }
    }
    return $sum
}

foreach ($n in 2..10000) {
    $s = Get-AliquotSum $n
    if ($s -eq $n) { "$n is perfect" }
}
"28 is " + $(if ((Get-AliquotSum 28) -gt 28) { 'abundant' } elseif ((Get-AliquotSum 28) -lt 28) { 'deficient' } else { 'perfect' })
