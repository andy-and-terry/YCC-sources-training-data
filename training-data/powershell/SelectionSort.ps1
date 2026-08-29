function SelectionSort {
    param([int[]]$Items)

    $arr = $Items.Clone()
    for ($i = 0; $i -lt $arr.Count - 1; $i++) {
        $minIdx = $i
        for ($j = $i + 1; $j -lt $arr.Count; $j++) {
            if ($arr[$j] -lt $arr[$minIdx]) { $minIdx = $j }
        }
        $temp = $arr[$i]
        $arr[$i] = $arr[$minIdx]
        $arr[$minIdx] = $temp
    }
    return $arr
}

SelectionSort -Items @(5, 3, 8, 1, 9, 2)
