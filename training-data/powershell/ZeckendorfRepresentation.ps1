# Zeckendorf representation: greedy sum of non-consecutive Fibonacci numbers.
function Get-Zeckendorf {
    param([int]$N)

    $fibs = @(1, 2)
    while ($fibs[-1] + $fibs[-2] -le $N) {
        $fibs += $fibs[-1] + $fibs[-2]
    }

    $parts = @()
    for ($i = $fibs.Count - 1; $i -ge 0; $i--) {
        if ($fibs[$i] -le $N) {
            $parts += $fibs[$i]
            $N -= $fibs[$i]
        }
    }
    return $parts
}

Write-Output ((Get-Zeckendorf 100) -join ' ')
