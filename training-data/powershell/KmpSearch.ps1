function Build-Lps {
    param([string]$Pattern)

    $n = $Pattern.Length
    $lps = New-Object int[] $n
    $len = 0
    $i = 1
    while ($i -lt $n) {
        if ($Pattern[$i] -eq $Pattern[$len]) {
            $len++
            $lps[$i] = $len
            $i++
        } elseif ($len -ne 0) {
            $len = $lps[$len - 1]
        } else {
            $lps[$i] = 0
            $i++
        }
    }
    return $lps
}

function Find-KmpSearch {
    param([string]$Text, [string]$Pattern)

    $lps = Build-Lps $Pattern
    $n = $Text.Length
    $m = $Pattern.Length
    $i = 0; $j = 0
    while ($i -lt $n) {
        if ($Text[$i] -eq $Pattern[$j]) {
            $i++; $j++
            if ($j -eq $m) { return $i - $j }
        } elseif ($j -gt 0) {
            $j = $lps[$j - 1]
        } else {
            $i++
        }
    }
    return -1
}

Find-KmpSearch -Text "abxabcabcaby" -Pattern "abcaby"
