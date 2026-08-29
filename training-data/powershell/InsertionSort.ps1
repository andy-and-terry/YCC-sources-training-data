function InsertionSort {
    param([int[]]$Items)

    $arr = $Items.Clone()
    for ($i = 1; $i -lt $arr.Count; $i++) {
        $key = $arr[$i]
        $j = $i - 1
        while ($j -ge 0 -and $arr[$j] -gt $key) {
            $arr[$j + 1] = $arr[$j]
            $j--
        }
        $arr[$j + 1] = $key
    }
    return $arr
}

InsertionSort -Items @(12, 11, 13, 5, 6)
