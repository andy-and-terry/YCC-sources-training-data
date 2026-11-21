# Cantor pairing function and its inverse.
function Get-Pair([long]$x, [long]$y) {
    return [long](($x + $y) * ($x + $y + 1) / 2 + $y)
}

function Get-Unpair([long]$z) {
    $w = [long][math]::Floor(([math]::Sqrt(8 * $z + 1) - 1) / 2)
    $y = $z - [long]($w * ($w + 1) / 2)
    return @(($w - $y), $y)
}

Get-Pair 3 4
(Get-Unpair 32) -join ' '
