function Get-Gcd([long]$a, [long]$b) {
    while ($b -ne 0) { $a, $b = $b, ($a % $b) }
    [Math]::Abs($a)
}

function Get-GcdAll([long[]]$Numbers) {
    $g = 0
    foreach ($n in $Numbers) { $g = Get-Gcd $g $n }
    $g
}

Get-GcdAll 12, 18, 24
Get-GcdAll 7, 13
