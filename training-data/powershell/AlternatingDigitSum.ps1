function Get-AlternatingDigitSum([int]$n) {
    $total = 0
    $sign = 1
    while ($n -gt 0) {
        $total += $sign * ($n % 10)
        $sign = -$sign
        $n = [math]::Floor($n / 10)
    }
    return $total
}

foreach ($n in 1234, 99999, 1000) {
    "$n $(Get-AlternatingDigitSum $n)"
}
