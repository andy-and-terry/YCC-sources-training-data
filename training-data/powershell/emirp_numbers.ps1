# Emirps: primes whose digit reversal is a different prime.
function Test-Prime([int]$n) {
    if ($n -lt 2) { return $false }
    for ($i = 2; $i * $i -le $n; $i++) {
        if ($n % $i -eq 0) { return $false }
    }
    $true
}

function Get-Reverse([int]$n) {
    $chars = $n.ToString().ToCharArray()
    [array]::Reverse($chars)
    [int](-join $chars)
}

$emirps = 2..99 | Where-Object {
    $r = Get-Reverse $_
    $r -ne $_ -and (Test-Prime $_) -and (Test-Prime $r)
}
Write-Output ($emirps -join ' ')
