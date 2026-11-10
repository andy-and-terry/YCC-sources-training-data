function Test-Prime([long]$n) {
    if ($n -lt 2) { return $false }
    for ($i = 2; $i * $i -le $n; $i++) { if ($n % $i -eq 0) { return $false } }
    return $true
}
$out = @()
for ($n = 2; $out.Count -lt 10; $n++) {
    $chars = "$n".ToCharArray(); [array]::Reverse($chars)
    $r = [long](-join $chars)
    if ($r -ne $n -and (Test-Prime $n) -and (Test-Prime $r)) { $out += $n }
}
$out -join ' ' # 13 17 31 37 71 73 79 97 107 113
