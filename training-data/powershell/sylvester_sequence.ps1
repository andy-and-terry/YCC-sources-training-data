# Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
[bigint]$s = 2
for ($i = 0; $i -lt 8; $i++) {
    Write-Output "s($i) = $s"
    $s = $s * $s - $s + 1
}
