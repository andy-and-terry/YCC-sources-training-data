function Get-Fibonacci {
    param([int]$Count)

    $result = @()
    $a, $b = 0, 1
    for ($i = 0; $i -lt $Count; $i++) {
        $result += $a
        $a, $b = $b, ($a + $b)
    }
    return $result
}

Get-Fibonacci -Count 11
