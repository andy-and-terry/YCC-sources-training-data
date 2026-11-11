# Repunits: numbers made only of the digit 1.
$r = 0
$out = foreach ($i in 1..5) {
    $r = $r * 10 + 1
    $r
}
Write-Output ($out -join ' ')
