# Moser-de Bruijn sequence: binary digits of n read in base 4.
function Get-Moser([int]$n) {
    $result = 0
    $place = 1
    while ($n -gt 0) {
        if ($n -band 1) { $result += $place }
        $n = $n -shr 1
        $place *= 4
    }
    return $result
}

(0..11 | ForEach-Object { Get-Moser $_ }) -join ' '
