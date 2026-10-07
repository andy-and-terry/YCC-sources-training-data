function Get-Permutations {
    param([array]$Items)

    if ($Items.Count -le 1) {
        return , $Items
    }

    $result = New-Object System.Collections.ArrayList
    for ($i = 0; $i -lt $Items.Count; $i++) {
        $before = if ($i -gt 0) { @($Items[0..($i - 1)]) } else { @() }
        $after = if ($i -lt $Items.Count - 1) { @($Items[($i + 1)..($Items.Count - 1)]) } else { @() }
        $rest = $before + $after

        foreach ($perm in Get-Permutations -Items $rest) {
            [void]$result.Add(@($Items[$i]) + $perm)
        }
    }
    return $result
}

Get-Permutations -Items @(1, 2, 3) | ForEach-Object { $_ -join ',' }
