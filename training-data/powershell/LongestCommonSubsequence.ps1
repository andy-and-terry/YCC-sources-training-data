function Get-LongestCommonSubsequence {
    param([string]$A, [string]$B)

    $m = $A.Length
    $n = $B.Length
    $dp = New-Object 'int[,]' ($m + 1), ($n + 1)

    for ($i = 1; $i -le $m; $i++) {
        for ($j = 1; $j -le $n; $j++) {
            if ($A[$i - 1] -eq $B[$j - 1]) {
                $dp[$i, $j] = $dp[$i - 1, $j - 1] + 1
            } else {
                $dp[$i, $j] = [Math]::Max($dp[$i - 1, $j], $dp[$i, $j - 1])
            }
        }
    }

    return $dp[$m, $n]
}

Get-LongestCommonSubsequence -A "ABCBDAB" -B "BDCABA"
Get-LongestCommonSubsequence -A "AGGTAB" -B "GXTXAYB"
