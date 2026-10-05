function Get-PrimeFactors {
    param([int]$Number)
    $n = $Number
    $factors = [System.Collections.Generic.List[int]]::new()
    for ($p = 2; $p * $p -le $n; $p++) {
        while ($n % $p -eq 0) {
            $factors.Add($p)
            $n = [math]::Floor($n / $p)
        }
    }
    if ($n -gt 1) { $factors.Add($n) }
    $factors
}

foreach ($n in 360, 97, 1001) {
    '{0} = {1}' -f $n, ((Get-PrimeFactors -Number $n) -join ' * ')
}
