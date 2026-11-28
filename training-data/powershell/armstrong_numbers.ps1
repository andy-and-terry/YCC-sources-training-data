function Test-Armstrong([int]$n) {
    $digits = $n.ToString().ToCharArray() | ForEach-Object { [int][string]$_ }
    $sum = 0
    foreach ($d in $digits) { $sum += [math]::Pow($d, $digits.Count) }
    return $sum -eq $n
}

(1..999 | Where-Object { Test-Armstrong $_ }) -join ' '  # 1..9 153 370 371 407
