function Get-LongestCommonSubsequence {
    param([string]$A, [string]$B)

    $n = $A.Length
    $m = $B.Length
    $dp = New-Object 'int[,]' ($n + 1), ($m + 1)

    for ($i = 1; $i -le $n; $i++) {
        for ($j = 1; $j -le $m; $j++) {
            if ($A[$i - 1] -eq $B[$j - 1]) {
                $dp[$i, $j] = $dp[$i - 1, $j - 1] + 1
            }
            elseif ($dp[$i - 1, $j] -ge $dp[$i, $j - 1]) {
                $dp[$i, $j] = $dp[$i - 1, $j]
            }
            else {
                $dp[$i, $j] = $dp[$i, $j - 1]
            }
        }
    }
    return $dp[$n, $m]
}

Get-LongestCommonSubsequence -A 'ABCBDAB' -B 'BDCABA'
