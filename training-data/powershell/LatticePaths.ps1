# Lattice paths with a DP row.
function Get-LatticePaths([int]$n) {
    $row = @(1) * ($n + 1)
    for ($k = 0; $k -lt $n; $k++) {
        for ($j = 1; $j -le $n; $j++) { $row[$j] += $row[$j - 1] }
    }
    $row[$n]
}
Get-LatticePaths 3
