# Bead (gravity) sort.
function Invoke-BeadSort([int[]]$Nums) {
    $max = ($Nums | Measure-Object -Maximum).Maximum
    $cols = 1..$max | ForEach-Object { $i = $_; @($Nums | Where-Object { $_ -ge $i }).Count }
    $rows = 1..$Nums.Count | ForEach-Object { $r = $_; @($cols | Where-Object { $_ -ge $r }).Count }
    [array]::Reverse($rows)
    $rows
}
(Invoke-BeadSort 5, 3, 1, 4, 2) -join ','
