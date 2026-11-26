# Emirps below 200; expect 15.
function Test-Prime([int]$n) {
    if ($n -lt 2) { return $false }
    for ($d = 2; $d * $d -le $n; $d++) { if ($n % $d -eq 0) { return $false } }
    return $true
}

function Get-Reverse([int]$n) { [int](-join ("$n".ToCharArray()[-1..-("$n".Length)])) }
$found = 2..199 | Where-Object { $r = Get-Reverse $_; $r -ne $_ -and (Test-Prime $_) -and (Test-Prime $r) }
"$($found.Count): $($found -join ' ')"
