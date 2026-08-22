function Invoke-BubbleSort {
    param([int[]]$Items)
    $arr = $Items.Clone()
    for ($i = 0; $i -lt $arr.Length; $i++) {
        for ($j = 0; $j -lt $arr.Length - $i - 1; $j++) {
            if ($arr[$j] -gt $arr[$j + 1]) {
                $temp = $arr[$j]
                $arr[$j] = $arr[$j + 1]
                $arr[$j + 1] = $temp
            }
        }
    }
    return $arr
}

Invoke-BubbleSort -Items @(5, 2, 9, 1, 5, 6)
