function Get-MinMatrixChainCost {
    param([int[]]$Dimensions)

    $n = $Dimensions.Length - 1
    $cost = New-Object 'int[,]' ($n + 1), ($n + 1)

    for ($len = 2; $len -le $n; $len++) {
        for ($i = 1; $i -le $n - $len + 1; $i++) {
            $j = $i + $len - 1
            $cost[$i, $j] = [int]::MaxValue
            for ($k = $i; $k -lt $j; $k++) {
                $candidate = $cost[$i, $k] + $cost[$k + 1, $j] + $Dimensions[$i - 1] * $Dimensions[$k] * $Dimensions[$j]
                if ($candidate -lt $cost[$i, $j]) { $cost[$i, $j] = $candidate }
            }
        }
    }
    return $cost[1, $n]
}

Get-MinMatrixChainCost -Dimensions @(40, 20, 30, 10, 30)
