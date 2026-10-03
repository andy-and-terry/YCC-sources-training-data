function Get-Partition {
    param([int[]]$Arr, [int]$Lo, [int]$Hi)

    $pivot = $Arr[$Hi]
    $i = $Lo
    for ($j = $Lo; $j -lt $Hi; $j++) {
        if ($Arr[$j] -le $pivot) {
            $tmp = $Arr[$i]; $Arr[$i] = $Arr[$j]; $Arr[$j] = $tmp
            $i++
        }
    }
    $tmp = $Arr[$i]; $Arr[$i] = $Arr[$Hi]; $Arr[$Hi] = $tmp
    return $i
}

function Get-KthLargest {
    param([int[]]$Arr, [int]$K)

    $n = $Arr.Length
    $target = $n - $K
    $lo = 0; $hi = $n - 1
    while ($true) {
        $p = Get-Partition -Arr $Arr -Lo $lo -Hi $hi
        if ($p -eq $target) { return $Arr[$p] }
        elseif ($p -lt $target) { $lo = $p + 1 }
        else { $hi = $p - 1 }
    }
}

Get-KthLargest -Arr @(3, 2, 1, 5, 6, 4) -K 2
