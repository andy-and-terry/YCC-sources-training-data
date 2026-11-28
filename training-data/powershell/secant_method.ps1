function Get-Secant([scriptblock]$F, [double]$X0, [double]$X1) {
    for ($i = 0; $i -lt 50; $i++) {
        $f0 = & $F $X0
        $f1 = & $F $X1
        if ($f1 -eq $f0) { break }
        $next = $X1 - $f1 * ($X1 - $X0) / ($f1 - $f0)
        $X0 = $X1; $X1 = $next
        if ([math]::Abs($X1 - $X0) -lt 1e-12) { break }
    }
    $X1
}

'{0:F10}' -f (Get-Secant { param($x) $x * $x - 2 } 1 2)
