function Test-Prime([int]$n) {
    if ($n -lt 2) { return $false }
    for ($i = 2; $i * $i -le $n; $i++) {
        if ($n % $i -eq 0) { return $false }
    }
    return $true
}

$emirps = 2..199 | Where-Object {
    $r = [int](-join $_.ToString().ToCharArray()[-1..-($_.ToString().Length)])
    $r -ne $_ -and (Test-Prime $_) -and (Test-Prime $r)
}
$emirps -join ' '  # 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199
