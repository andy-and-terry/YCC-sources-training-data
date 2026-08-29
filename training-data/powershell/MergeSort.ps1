function MergeArrays {
    param([int[]]$Left, [int[]]$Right)

    $result = @()
    $i = 0; $j = 0
    while ($i -lt $Left.Count -and $j -lt $Right.Count) {
        if ($Left[$i] -le $Right[$j]) {
            $result += $Left[$i]; $i++
        } else {
            $result += $Right[$j]; $j++
        }
    }
    $result += $Left[$i..($Left.Count - 1)]
    $result += $Right[$j..($Right.Count - 1)]
    return $result
}

function MergeSort {
    param([int[]]$Items)

    if ($Items.Count -le 1) { return $Items }
    $mid = [math]::Floor($Items.Count / 2)
    $left = MergeSort $Items[0..($mid - 1)]
    $right = MergeSort $Items[$mid..($Items.Count - 1)]
    return MergeArrays -Left $left -Right $right
}

MergeSort -Items @(5, 2, 9, 1, 5, 6)
