function Sort-ByShell {
    param([int[]]$Numbers)

    $arr = $Numbers.Clone()
    $n = $arr.Length
    $gap = [math]::Floor($n / 2)

    while ($gap -gt 0) {
        for ($i = $gap; $i -lt $n; $i++) {
            $temp = $arr[$i]
            $j = $i
            while ($j -ge $gap -and $arr[$j - $gap] -gt $temp) {
                $arr[$j] = $arr[$j - $gap]
                $j -= $gap
            }
            $arr[$j] = $temp
        }
        $gap = [math]::Floor($gap / 2)
    }
    return $arr
}

Sort-ByShell -Numbers @(9, 5, 1, 4, 3, 8, 2, 7)
