function Get-PrimeCountBelow([int]$n) {
    if ($n -lt 3) { return 0 }
    $composite = New-Object bool[] $n
    $count = 0
    for ($i = 2; $i -lt $n; $i++) {
        if ($composite[$i]) { continue }
        $count++
        for ($j = $i * $i; $j -lt $n; $j += $i) { $composite[$j] = $true }
    }
    $count
}

Get-PrimeCountBelow 100
