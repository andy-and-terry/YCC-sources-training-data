function Find-RabinKarp {
    param([string]$Text, [string]$Pattern)

    $base = 256
    $prime = 101
    $m = $Pattern.Length
    $n = $Text.Length
    $positions = @()
    if ($m -gt $n) { return $positions }

    $h = 1
    for ($i = 0; $i -lt $m - 1; $i++) { $h = ($h * $base) % $prime }

    $patHash = 0
    $textHash = 0
    for ($i = 0; $i -lt $m; $i++) {
        $patHash = ($patHash * $base + [int][char]$Pattern[$i]) % $prime
        $textHash = ($textHash * $base + [int][char]$Text[$i]) % $prime
    }

    for ($i = 0; $i -le $n - $m; $i++) {
        if ($patHash -eq $textHash -and $Text.Substring($i, $m) -eq $Pattern) {
            $positions += $i
        }
        if ($i -lt $n - $m) {
            $textHash = (($textHash - [int][char]$Text[$i] * $h) * $base + [int][char]$Text[$i + $m]) % $prime
            if ($textHash -lt 0) { $textHash += $prime }
        }
    }
    return $positions
}

Find-RabinKarp -Text 'abxabcabcaby' -Pattern 'abc'
