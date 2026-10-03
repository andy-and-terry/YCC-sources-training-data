function Get-ZArray {
    param([string]$Text)

    $n = $Text.Length
    $z = [int[]]::new($n)
    $left = 0; $right = 0
    for ($i = 1; $i -lt $n; $i++) {
        if ($i -le $right) {
            $z[$i] = [Math]::Min($right - $i + 1, $z[$i - $left])
        }
        while ($i + $z[$i] -lt $n -and $Text[$z[$i]] -eq $Text[$i + $z[$i]]) {
            $z[$i]++
        }
        if ($i + $z[$i] - 1 -gt $right) {
            $left = $i; $right = $i + $z[$i] - 1
        }
    }
    return $z
}

function Find-ZSearch {
    param([string]$Text, [string]$Pattern)

    $combined = $Pattern + '$' + $Text
    $z = Get-ZArray -Text $combined
    $patLen = $Pattern.Length
    $positions = @()
    for ($i = 0; $i -lt $z.Length; $i++) {
        if ($z[$i] -eq $patLen) { $positions += ($i - $patLen - 1) }
    }
    return $positions
}

Find-ZSearch -Text 'ababcabcabababd' -Pattern 'abab'
