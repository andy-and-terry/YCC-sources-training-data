function Find-TwoSum {
    param([int[]]$Nums, [int]$Target)

    $seen = @{}
    for ($i = 0; $i -lt $Nums.Count; $i++) {
        $complement = $Target - $Nums[$i]
        if ($seen.ContainsKey($complement)) {
            return @($seen[$complement], $i)
        }
        $seen[$Nums[$i]] = $i
    }
    return @()
}

Find-TwoSum -Nums @(2, 7, 11, 15) -Target 9
