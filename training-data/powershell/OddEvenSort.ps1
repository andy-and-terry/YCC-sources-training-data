function Invoke-OddEvenSort {
    param([int[]]$Array)
    $a = $Array.Clone()
    $sorted = $false
    while (-not $sorted) {
        $sorted = $true
        foreach ($start in 1, 0) {
            for ($i = $start; $i -lt $a.Length - 1; $i += 2) {
                if ($a[$i] -gt $a[$i + 1]) {
                    $a[$i], $a[$i + 1] = $a[$i + 1], $a[$i]
                    $sorted = $false
                }
            }
        }
    }
    return $a
}

(Invoke-OddEvenSort -Array @(9, 7, 5, 3, 1, 2, 4)) -join ' '
