function Test-Isbn10 {
    param([string]$Isbn)
    $clean = $Isbn -replace '-', ''
    if ($clean -notmatch '^\d{9}[\dX]$') { return $false }
    $sum = 0
    for ($i = 0; $i -lt 10; $i++) {
        $value = if ($clean[$i] -eq 'X') { 10 } else { [int][string]$clean[$i] }
        $sum += (10 - $i) * $value
    }
    return $sum % 11 -eq 0
}

'3-598-21508-8', '3-598-21507-X', '3-598-2K507-0' | ForEach-Object {
    '{0} valid: {1}' -f $_, (Test-Isbn10 $_)
}
