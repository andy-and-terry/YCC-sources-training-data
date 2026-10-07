function Get-LongestCommonSubsequence {
    param([string]$A, [string]$B)

    $m = $A.Length; $n = $B.Length
    $dp = New-Object 'string[,]' ($m + 1), ($n + 1)
    for ($i = 0; $i -le $m; $i++) { $dp[$i, 0] = '' }
    for ($j = 0; $j -le $n; $j++) { $dp[0, $j] = '' }
    for ($i = 1; $i -le $m; $i++) {
        for ($j = 1; $j -le $n; $j++) {
            if ($A[$i - 1] -eq $B[$j - 1]) {
                $dp[$i, $j] = $dp[$i - 1, $j - 1] + $A[$i - 1]
            } elseif ($dp[$i - 1, $j].Length -ge $dp[$i, $j - 1].Length) {
                $dp[$i, $j] = $dp[$i - 1, $j]
            } else {
                $dp[$i, $j] = $dp[$i, $j - 1]
            }
        }
    }
    return $dp[$m, $n]
}

Get-LongestCommonSubsequence -A "ABCBDAB" -B "BDCABA"
