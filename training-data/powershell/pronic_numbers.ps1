function Test-Pronic([int]$x) {
    $n = [math]::Floor([math]::Sqrt($x))
    return ($n * ($n + 1)) -eq $x
}

(0..9 | ForEach-Object { $_ * ($_ + 1) }) -join ' '  # 0 2 6 12 20 30 42 56 72 90
"{0} {1}" -f (Test-Pronic 56), (Test-Pronic 57)       # True False
