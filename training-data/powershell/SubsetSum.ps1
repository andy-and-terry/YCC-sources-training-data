function Test-SubsetSum {
    param([int[]]$Numbers, [int]$Target)

    $dp = [bool[]]::new($Target + 1)
    $dp[0] = $true

    foreach ($num in $Numbers) {
        for ($sum = $Target; $sum -ge $num; $sum--) {
            if ($dp[$sum - $num]) {
                $dp[$sum] = $true
            }
        }
    }

    return $dp[$Target]
}

$numbers = @(3, 34, 4, 12, 5, 2)
Test-SubsetSum -Numbers $numbers -Target 9
Test-SubsetSum -Numbers $numbers -Target 10
Test-SubsetSum -Numbers $numbers -Target 40
