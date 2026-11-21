# Disarium numbers: digits raised to their 1-based positions sum to n.
function Test-Disarium([int]$n) {
    $digits = $n.ToString().ToCharArray()
    $sum = 0
    for ($i = 0; $i -lt $digits.Length; $i++) {
        $sum += [math]::Pow([int]::Parse($digits[$i]), $i + 1)
    }
    return $sum -eq $n
}

(1..999 | Where-Object { Test-Disarium $_ }) -join ' '
