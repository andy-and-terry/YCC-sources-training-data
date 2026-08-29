function Find-BinarySearch {
    param([int[]]$Arr, [int]$Target)

    $low = 0; $high = $Arr.Count - 1
    while ($low -le $high) {
        $mid = [math]::Floor(($low + $high) / 2)
        if ($Arr[$mid] -eq $Target) {
            return $mid
        } elseif ($Arr[$mid] -lt $Target) {
            $low = $mid + 1
        } else {
            $high = $mid - 1
        }
    }
    return -1
}

Find-BinarySearch -Arr @(1, 3, 5, 7, 9, 11) -Target 7
