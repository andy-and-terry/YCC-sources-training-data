function Get-Persistence([long]$n) {
    $steps = 0
    while ($n -ge 10) {
        $product = 1
        foreach ($ch in $n.ToString().ToCharArray()) { $product *= [int][string]$ch }
        $n = $product
        $steps++
    }
    return $steps
}

foreach ($n in 39, 77, 999, 10) {
    "$n $(Get-Persistence $n)"
}
