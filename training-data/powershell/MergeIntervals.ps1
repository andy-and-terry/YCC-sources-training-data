function Merge-Intervals {
    param([int[][]]$Intervals)

    if ($Intervals.Count -eq 0) { return @() }
    $sorted = $Intervals | Sort-Object { $_[0] }
    $merged = [System.Collections.Generic.List[int[]]]::new()
    $merged.Add($sorted[0])

    for ($i = 1; $i -lt $sorted.Count; $i++) {
        $last = $merged[$merged.Count - 1]
        $current = $sorted[$i]
        if ($current[0] -le $last[1]) {
            $last[1] = [Math]::Max($last[1], $current[1])
        } else {
            $merged.Add($current)
        }
    }
    return $merged
}

$intervals = @(@(1, 3), @(2, 6), @(8, 10), @(15, 18))
Merge-Intervals -Intervals $intervals | ForEach-Object { "[$($_[0]), $($_[1])]" }
