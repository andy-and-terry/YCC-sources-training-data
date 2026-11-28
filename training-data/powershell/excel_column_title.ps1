function Get-ColumnTitle {
    param([int]$N)
    $title = ''
    while ($N -gt 0) {
        $N--
        $title = [char](65 + $N % 26) + $title
        $N = [Math]::Floor($N / 26)
    }
    $title
}

"$(Get-ColumnTitle 28) $(Get-ColumnTitle 701)"   # AB ZY
