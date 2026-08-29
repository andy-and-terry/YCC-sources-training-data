function Test-PowerOfTwo {
    param([int]$N)

    return ($N -gt 0) -and (($N -band ($N - 1)) -eq 0)
}

Test-PowerOfTwo -N 16
Test-PowerOfTwo -N 18
