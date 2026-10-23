function Get-DigitSum {
    param([int]$N)

    $total = 0
    foreach ($c in $N.ToString().ToCharArray()) {
        $total += [int][string]$c
    }
    return $total
}

function Test-Smith {
    param([int]$N)

    $m = $N
    $factorSum = 0
    $factorCount = 0
    $p = 2
    while ($p * $p -le $m) {
        while ($m % $p -eq 0) {
            $factorSum += Get-DigitSum $p
            $factorCount++
            $m = $m / $p
        }
        $p++
    }
    if ($m -gt 1) {
        $factorSum += Get-DigitSum $m
        $factorCount++
    }
    return ($factorCount -gt 1) -and ($factorSum -eq (Get-DigitSum $N))
}

$result = foreach ($n in 4..99) {
    if (Test-Smith $n) { $n }
}
Write-Output ($result -join ' ')
