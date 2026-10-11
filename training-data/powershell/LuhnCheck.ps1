function Test-Luhn {
    param([string]$Number)
    $digits = ($Number -replace '\s', '').ToCharArray()
    $sum = 0
    $double = $false
    for ($i = $digits.Length - 1; $i -ge 0; $i--) {
        $d = [int][string]$digits[$i]
        if ($double) {
            $d *= 2
            if ($d -gt 9) { $d -= 9 }
        }
        $sum += $d
        $double = -not $double
    }
    return $sum % 10 -eq 0
}

"4539 5787 6362 1486 -> $(Test-Luhn '4539 5787 6362 1486')"
"1234 5678 1234 5678 -> $(Test-Luhn '1234 5678 1234 5678')"
