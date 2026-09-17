function Invoke-Heapify {
    param([System.Collections.ArrayList]$Arr, [int]$Size, [int]$Root)

    $largest = $Root
    $left = 2 * $Root + 1
    $right = 2 * $Root + 2

    if ($left -lt $Size -and $Arr[$left] -gt $Arr[$largest]) { $largest = $left }
    if ($right -lt $Size -and $Arr[$right] -gt $Arr[$largest]) { $largest = $right }

    if ($largest -ne $Root) {
        $temp = $Arr[$Root]
        $Arr[$Root] = $Arr[$largest]
        $Arr[$largest] = $temp
        Invoke-Heapify -Arr $Arr -Size $Size -Root $largest
    }
}

function Invoke-HeapSort {
    param([int[]]$Items)

    $arr = [System.Collections.ArrayList]::new($Items)
    $n = $arr.Count

    for ($i = [math]::Floor($n / 2) - 1; $i -ge 0; $i--) {
        Invoke-Heapify -Arr $arr -Size $n -Root $i
    }
    for ($i = $n - 1; $i -gt 0; $i--) {
        $temp = $arr[0]
        $arr[0] = $arr[$i]
        $arr[$i] = $temp
        Invoke-Heapify -Arr $arr -Size $i -Root 0
    }
    return $arr
}

Invoke-HeapSort -Items @(5, 3, 8, 1, 9, 2, 7)
