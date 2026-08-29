function Get-EditDistance {
    param([string]$A, [string]$B)

    $m = $A.Length; $n = $B.Length
    $table = New-Object 'int[,]' ($m + 1), ($n + 1)
    for ($i = 0; $i -le $m; $i++) { $table[$i, 0] = $i }
    for ($j = 0; $j -le $n; $j++) { $table[0, $j] = $j }
    for ($i = 1; $i -le $m; $i++) {
        for ($j = 1; $j -le $n; $j++) {
            $cost = if ($A[$i - 1] -eq $B[$j - 1]) { 0 } else { 1 }
            $minVal = $table[$i - 1, $j] + 1
            if ($table[$i, $j - 1] + 1 -lt $minVal) { $minVal = $table[$i, $j - 1] + 1 }
            if ($table[$i - 1, $j - 1] + $cost -lt $minVal) { $minVal = $table[$i - 1, $j - 1] + $cost }
            $table[$i, $j] = $minVal
        }
    }
    return $table[$m, $n]
}

Get-EditDistance -A "kitten" -B "sitting"
