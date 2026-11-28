function Test-Prime([int]$n) {
    if ($n -lt 2) { return $false }
    for ($i = 2; $i * $i -le $n; $i++) { if ($n % $i -eq 0) { return $false } }
    $true
}

$out = 2..99 | Where-Object {
    $r = [int](-join ($_.ToString().ToCharArray()[-1..-($_.ToString().Length)]))
    $r -ne $_ -and (Test-Prime $_) -and (Test-Prime $r)
}
$out -join ' '
