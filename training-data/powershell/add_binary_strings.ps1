function Add-Binary {
    param([string]$A, [string]$B)
    $i = $A.Length - 1; $j = $B.Length - 1; $carry = 0; $out = ''
    while ($i -ge 0 -or $j -ge 0 -or $carry -gt 0) {
        $sum = $carry
        if ($i -ge 0) { $sum += [int]::Parse($A[$i]); $i-- }
        if ($j -ge 0) { $sum += [int]::Parse($B[$j]); $j-- }
        $out = "$($sum % 2)$out"
        $carry = [Math]::Floor($sum / 2)
    }
    $out
}

Add-Binary '1010' '1011'   # 10101
