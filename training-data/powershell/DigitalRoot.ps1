function Get-DigitalRoot {
    param([long]$N)
    $N = [Math]::Abs($N)
    while ($N -ge 10) {
        $sum = 0
        foreach ($ch in $N.ToString().ToCharArray()) { $sum += [int][string]$ch }
        $N = $sum
    }
    $N
}

942, 132189, 493193 | ForEach-Object { '{0} -> {1}' -f $_, (Get-DigitalRoot $_) }
