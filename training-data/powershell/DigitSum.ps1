function Get-DigitSum {
    param([int]$N)

    $total = 0
    $num = $N
    while ($num -gt 0) {
        $total += $num % 10
        $num = [math]::Floor($num / 10)
    }
    return $total
}

Get-DigitSum -N 12345
