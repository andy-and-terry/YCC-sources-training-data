function Get-Factorial {
    param([int]$N)

    $result = 1
    for ($i = 1; $i -le $N; $i++) {
        $result *= $i
    }
    return $result
}

Get-Factorial -N 10
