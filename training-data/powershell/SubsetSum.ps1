function SubsetSum {
    param([int[]]$Nums, [int]$Target)
    $n = $Nums.Count
    $dp = New-Object 'object[]' ($n + 1)
    for ($i = 0; $i -le $n; $i++) {
        $dp[$i] = New-Object 'bool[]' ($Target + 1)
        $dp[$i][0] = $true
    }

    for ($i = 1; $i -le $n; $i++) {
        for ($t = 1; $t -le $Target; $t++) {
            $dp[$i][$t] = $dp[$i - 1][$t]
            if ($Nums[$i - 1] -le $t -and $dp[$i - 1][$t - $Nums[$i - 1]]) {
                $dp[$i][$t] = $true
            }
        }
    }
    return $dp[$n][$Target]
}

SubsetSum -Nums @(3, 34, 4, 12, 5, 2) -Target 9
SubsetSum -Nums @(3, 34, 4, 12, 5, 2) -Target 30
