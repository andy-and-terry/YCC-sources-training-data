function Get-PopCount {
    param([uint64]$N)
    $c = 0
    while ($N -ne 0) {
        $N = $N -band ($N - 1)
        $c++
    }
    $c
}

Get-PopCount 0xB7
Get-PopCount 255
