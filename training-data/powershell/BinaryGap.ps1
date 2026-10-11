function Get-BinaryGap {
    param([int]$Number)
    $bits = [Convert]::ToString($Number, 2)
    $best = 0
    $current = 0
    $seenOne = $false
    foreach ($ch in $bits.ToCharArray()) {
        if ($ch -eq '1') {
            if ($seenOne -and $current -gt $best) { $best = $current }
            $seenOne = $true
            $current = 0
        } else {
            $current++
        }
    }
    [PSCustomObject]@{ Number = $Number; Binary = $bits; LongestGap = $best }
}

1041, 32, 529, 15 | ForEach-Object { Get-BinaryGap -Number $_ }
