function Get-Gcd([long]$a, [long]$b) { while ($b -ne 0) { $a, $b = $b, ($a % $b) }; $a }

function Get-Rho([long]$n) {
    if ($n % 2 -eq 0) { return 2 }
    $x = 2; $y = 2; $d = 1
    while ($d -eq 1) {
        $x = ($x * $x + 1) % $n
        $y = ($y * $y + 1) % $n
        $y = ($y * $y + 1) % $n
        $d = Get-Gcd ([math]::Abs($x - $y)) $n
    }
    $d
}

$n = 8051; $p = Get-Rho $n
"$n = $p * $($n / $p)"
