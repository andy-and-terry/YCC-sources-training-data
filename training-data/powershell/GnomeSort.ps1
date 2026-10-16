function Invoke-GnomeSort {
    param([int[]]$Array)
    $a = $Array.Clone()
    $pos = 0
    while ($pos -lt $a.Length) {
        if ($pos -eq 0 -or $a[$pos] -ge $a[$pos - 1]) {
            $pos++
        } else {
            $a[$pos], $a[$pos - 1] = $a[$pos - 1], $a[$pos]
            $pos--
        }
    }
    return $a
}

$sorted = Invoke-GnomeSort -Array @(34, 2, 10, -5, 99, 7)
"Sorted: $($sorted -join ', ')"
