function Get-Knapsack {
    param([int[]]$Weights, [int[]]$Values, [int]$Capacity)

    $dp = New-Object int[] ($Capacity + 1)
    for ($i = 0; $i -lt $Weights.Count; $i++) {
        for ($cap = $Capacity; $cap -ge $Weights[$i]; $cap--) {
            $withItem = $dp[$cap - $Weights[$i]] + $Values[$i]
            if ($withItem -gt $dp[$cap]) { $dp[$cap] = $withItem }
        }
    }
    return $dp[$Capacity]
}

Get-Knapsack -Weights @(2, 3, 4, 5) -Values @(3, 4, 5, 6) -Capacity 5
