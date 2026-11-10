$limit = 80
$composite = New-Object bool[] ($limit + 1)
for ($i = 2; $i * $i -le $limit; $i++) {
    if (-not $composite[$i]) { for ($j = $i * $i; $j -le $limit; $j += $i) { $composite[$j] = $true } }
}
$pairs = foreach ($p in 3..($limit - 2)) {
    if (-not $composite[$p] -and -not $composite[$p + 2]) { "($p,$($p + 2))" }
}
$pairs -join ' ' # (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
