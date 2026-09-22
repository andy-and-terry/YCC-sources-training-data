function Heapify {
    param([System.Collections.ArrayList]$Arr, [int]$N, [int]$I)
    $largest = $I
    $left = 2 * $I + 1
    $right = 2 * $I + 2

    if ($left -lt $N -and $Arr[$left] -gt $Arr[$largest]) { $largest = $left }
    if ($right -lt $N -and $Arr[$right] -gt $Arr[$largest]) { $largest = $right }

    if ($largest -ne $I) {
        $tmp = $Arr[$I]
        $Arr[$I] = $Arr[$largest]
        $Arr[$largest] = $tmp
        Heapify -Arr $Arr -N $N -I $largest
    }
}

function HeapSort {
    param([System.Collections.ArrayList]$Arr)
    $n = $Arr.Count
    for ($i = [math]::Floor($n / 2) - 1; $i -ge 0; $i--) {
        Heapify -Arr $Arr -N $n -I $i
    }
    for ($i = $n - 1; $i -gt 0; $i--) {
        $tmp = $Arr[0]
        $Arr[0] = $Arr[$i]
        $Arr[$i] = $tmp
        Heapify -Arr $Arr -N $i -I 0
    }
    return $Arr
}

$data = [System.Collections.ArrayList]@(5, 3, 8, 1, 9, 2, 7)
HeapSort -Arr $data
