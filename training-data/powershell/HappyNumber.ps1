function Test-HappyNumber {
    param([int]$Number)
    $seen = [System.Collections.Generic.HashSet[int]]::new()
    while ($Number -ne 1 -and $seen.Add($Number)) {
        $sum = 0
        foreach ($d in $Number.ToString().ToCharArray()) {
            $digit = [int][string]$d
            $sum += $digit * $digit
        }
        $Number = $sum
    }
    return $Number -eq 1
}

1..30 | Where-Object { Test-HappyNumber $_ } | ForEach-Object { "$_ is happy" }
