function Get-Gould([int]$n) {
    $ones = ([Convert]::ToString($n, 2).ToCharArray() | Where-Object { $_ -eq '1' }).Count
    [math]::Pow(2, $ones)
}

(0..15 | ForEach-Object { Get-Gould $_ }) -join ' '
