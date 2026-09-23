function Sort-ByCounting {
    param([int[]]$Numbers)

    if ($Numbers.Count -eq 0) { return @() }
    $max = ($Numbers | Measure-Object -Maximum).Maximum
    $counts = New-Object int[] ($max + 1)
    foreach ($n in $Numbers) { $counts[$n]++ }

    $result = New-Object System.Collections.ArrayList
    for ($i = 0; $i -le $max; $i++) {
        for ($j = 0; $j -lt $counts[$i]; $j++) {
            [void]$result.Add($i)
        }
    }
    return $result
}

Sort-ByCounting -Numbers @(4, 2, 2, 8, 3, 3, 1)
