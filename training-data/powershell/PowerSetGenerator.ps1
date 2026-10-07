function Get-PowerSet {
    param([array]$Items)

    $count = $Items.Count
    $subsets = New-Object System.Collections.ArrayList

    for ($mask = 0; $mask -lt [math]::Pow(2, $count); $mask++) {
        $subset = New-Object System.Collections.ArrayList
        for ($bit = 0; $bit -lt $count; $bit++) {
            if ($mask -band (1 -shl $bit)) {
                [void]$subset.Add($Items[$bit])
            }
        }
        [void]$subsets.Add($subset.ToArray())
    }
    return $subsets
}

Get-PowerSet -Items @('a', 'b', 'c') | ForEach-Object { "{" + ($_ -join ',') + "}" }
