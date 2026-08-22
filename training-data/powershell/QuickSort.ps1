function QuickSort {
    param([int[]]$Items)

    if ($Items.Count -le 1) { return $Items }

    $pivot = $Items[[math]::Floor($Items.Count / 2)]
    $left = $Items | Where-Object { $_ -lt $pivot }
    $mid = $Items | Where-Object { $_ -eq $pivot }
    $right = $Items | Where-Object { $_ -gt $pivot }

    return @(QuickSort $left) + @($mid) + @(QuickSort $right)
}

QuickSort -Items @(5, 3, 8, 1, 9, 2)
