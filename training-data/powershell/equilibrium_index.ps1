function Get-EquilibriumIndex {
    param([int[]]$Nums)
    $total = ($Nums | Measure-Object -Sum).Sum
    $left = 0
    for ($i = 0; $i -lt $Nums.Count; $i++) {
        if ($left -eq $total - $left - $Nums[$i]) { return $i }
        $left += $Nums[$i]
    }
    return -1
}

Get-EquilibriumIndex 1, 7, 3, 6, 5, 6   # 3
