function Invoke-FisherYatesShuffle {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [array]$Items
    )

    $arr = $Items.Clone()
    for ($i = $arr.Length - 1; $i -gt 0; $i--) {
        $j = Get-Random -Minimum 0 -Maximum ($i + 1)
        $temp = $arr[$i]
        $arr[$i] = $arr[$j]
        $arr[$j] = $temp
    }
    return $arr
}

Invoke-FisherYatesShuffle -Items @(1, 2, 3, 4, 5, 6, 7, 8)
