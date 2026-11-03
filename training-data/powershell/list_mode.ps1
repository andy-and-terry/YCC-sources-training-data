function Get-Modes([int[]]$items) {
    $groups = $items | Group-Object
    $top = ($groups | Measure-Object Count -Maximum).Maximum
    $groups | Where-Object Count -eq $top | ForEach-Object { [int]$_.Name } | Sort-Object
}

(Get-Modes 1, 2, 2, 3, 3, 4) -join ","
