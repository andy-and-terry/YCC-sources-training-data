function Invoke-CocktailShakerSort {
    param([int[]]$Array)
    $a = $Array.Clone()
    $lo = 0
    $hi = $a.Length - 1
    $swapped = $true
    while ($swapped) {
        $swapped = $false
        for ($i = $lo; $i -lt $hi; $i++) {
            if ($a[$i] -gt $a[$i + 1]) {
                $a[$i], $a[$i + 1] = $a[$i + 1], $a[$i]
                $swapped = $true
            }
        }
        $hi--
        for ($i = $hi; $i -gt $lo; $i--) {
            if ($a[$i - 1] -gt $a[$i]) {
                $a[$i - 1], $a[$i] = $a[$i], $a[$i - 1]
                $swapped = $true
            }
        }
        $lo++
    }
    return $a
}

(Invoke-CocktailShakerSort -Array @(5, 1, 4, 2, 8, 0, 2)) -join ' '
