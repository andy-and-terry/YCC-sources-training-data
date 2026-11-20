# Manhattan distance of two vectors.
function Get-Manhattan([int[]]$a, [int[]]$b) {
    $sum = 0
    for ($i = 0; $i -lt $a.Length; $i++) { $sum += [math]::Abs($a[$i] - $b[$i]) }
    $sum
}
Get-Manhattan @(1, 2) @(4, 6)
