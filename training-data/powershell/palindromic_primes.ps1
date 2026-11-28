function Test-Prime([int]$n) {
    if ($n -lt 2) { return $false }
    for ($i = 2; $i * $i -le $n; $i++) {
        if ($n % $i -eq 0) { return $false }
    }
    return $true
}

function Test-Palindrome([int]$n) {
    $s = $n.ToString()
    $chars = $s.ToCharArray()
    [array]::Reverse($chars)
    return $s -eq (-join $chars)
}

(2..199 | Where-Object { (Test-Palindrome $_) -and (Test-Prime $_) }) -join ' '
# 2 3 5 7 11 101 131 151 181 191
