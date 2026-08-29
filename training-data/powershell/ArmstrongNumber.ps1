function Test-Armstrong {
    param([int]$N)

    $digitsStr = $N.ToString()
    $power = $digitsStr.Length
    $total = 0
    foreach ($c in $digitsStr.ToCharArray()) {
        $d = [int]::Parse($c)
        $total += [math]::Pow($d, $power)
    }
    return $total -eq $N
}

Test-Armstrong -N 153
Test-Armstrong -N 154
