function Invoke-CombSort {
    param([int[]]$Array)
    $a = $Array.Clone()
    $gap = $a.Length
    $swapped = $true
    while ($gap -gt 1 -or $swapped) {
        $gap = [Math]::Max([Math]::Floor($gap / 1.3), 1)
        $swapped = $false
        for ($i = 0; $i + $gap -lt $a.Length; $i++) {
            if ($a[$i] -gt $a[$i + $gap]) {
                $a[$i], $a[$i + $gap] = $a[$i + $gap], $a[$i]
                $swapped = $true
            }
        }
    }
    return $a
}

"Sorted: $((Invoke-CombSort -Array @(8, 4, 1, 56, 3, -44, 23, -6, 28, 0)) -join ' ')"
