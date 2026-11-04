function Convert-Zigzag([string]$s, [int]$rows) {
    if ($rows -eq 1 -or $rows -ge $s.Length) { return $s }
    $lines = 1..$rows | ForEach-Object { [System.Text.StringBuilder]::new() }
    $r = 0; $step = 1
    foreach ($c in $s.ToCharArray()) {
        [void]$lines[$r].Append($c)
        if ($r -eq 0) { $step = 1 } elseif ($r -eq $rows - 1) { $step = -1 }
        $r += $step
    }
    -join $lines
}

Convert-Zigzag 'PAYPALISHIRING' 3
