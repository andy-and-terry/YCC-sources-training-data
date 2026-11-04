function Get-Ugly([int]$n) {
    $seq = [System.Collections.Generic.List[long]]::new()
    $seq.Add(1)
    $i2 = $i3 = $i5 = 0
    while ($seq.Count -lt $n) {
        $c2 = $seq[$i2] * 2; $c3 = $seq[$i3] * 3; $c5 = $seq[$i5] * 5
        $next = [Math]::Min($c2, [Math]::Min($c3, $c5))
        $seq.Add($next)
        if ($next -eq $c2) { $i2++ }
        if ($next -eq $c3) { $i3++ }
        if ($next -eq $c5) { $i5++ }
    }
    $seq[$n - 1]
}

(1..12 | ForEach-Object { Get-Ugly $_ }) -join ' '
