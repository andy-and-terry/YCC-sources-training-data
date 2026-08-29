function ConvertTo-Roman {
    param([int]$Num)

    $values = @(1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
    $symbols = @('M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I')
    $result = ''
    $remaining = $Num
    for ($i = 0; $i -lt $values.Count; $i++) {
        while ($remaining -ge $values[$i]) {
            $result += $symbols[$i]
            $remaining -= $values[$i]
        }
    }
    return $result
}

ConvertTo-Roman -Num 1994
