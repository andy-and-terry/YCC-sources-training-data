# Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
function Test-Keith([int]$n) {
    $seq = [System.Collections.Generic.List[int]]::new()
    foreach ($c in $n.ToString().ToCharArray()) { $seq.Add([int]::Parse($c)) }
    $k = $seq.Count
    while ($seq[$seq.Count - 1] -lt $n) {
        $sum = 0
        for ($i = $seq.Count - $k; $i -lt $seq.Count; $i++) { $sum += $seq[$i] }
        $seq.Add($sum)
    }
    return $seq[$seq.Count - 1] -eq $n
}

(10..1199 | Where-Object { Test-Keith $_ }) -join ' '
