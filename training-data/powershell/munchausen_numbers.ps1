# Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
function Test-Munchausen([int]$n) {
    $sum = 0
    foreach ($c in $n.ToString().ToCharArray()) {
        $d = [int]::Parse($c)
        if ($d -gt 0) { $sum += [math]::Pow($d, $d) }
    }
    return $sum -eq $n
}

(1..4999 | Where-Object { Test-Munchausen $_ }) -join ' '
