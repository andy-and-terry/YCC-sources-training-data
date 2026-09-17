function Get-MaxValue([int[]]$arr) {
    $max = $arr[0]
    foreach ($v in $arr) {
        if ($v -gt $max) { $max = $v }
    }
    return $max
}

function Invoke-CountingSortByDigit([int[]]$arr, [int]$place) {
    $output = New-Object int[] $arr.Length
    $count = New-Object int[] 10

    foreach ($v in $arr) {
        $digit = [math]::Floor($v / $place) % 10
        $count[$digit]++
    }

    for ($i = 1; $i -lt 10; $i++) {
        $count[$i] += $count[$i - 1]
    }

    for ($i = $arr.Length - 1; $i -ge 0; $i--) {
        $digit = [math]::Floor($arr[$i] / $place) % 10
        $count[$digit]--
        $output[$count[$digit]] = $arr[$i]
    }

    return $output
}

function Invoke-RadixSort([int[]]$arr) {
    $max = Get-MaxValue $arr
    $place = 1
    while ([math]::Floor($max / $place) -gt 0) {
        $arr = Invoke-CountingSortByDigit $arr $place
        $place *= 10
    }
    return $arr
}

$numbers = @(170, 45, 75, 90, 802, 24, 2, 66)
Invoke-RadixSort $numbers
