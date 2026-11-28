function Test-Happy([int]$n) {
    $seen = @{}
    while ($n -ne 1 -and -not $seen.ContainsKey($n)) {
        $seen[$n] = $true
        $n = ($n.ToString().ToCharArray() | ForEach-Object { [int][string]$_ * [int][string]$_ } | Measure-Object -Sum).Sum
    }
    return $n -eq 1
}

$found = @()
for ($n = 1; $found.Count -lt 8; $n++) {
    if (Test-Happy $n) { $found += $n }
}
$found -join ' '  # 1 7 10 13 19 23 28 31
