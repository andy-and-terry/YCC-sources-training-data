function Get-MinCoins {
    param([int[]]$Coins, [int]$Amount)

    $dp = New-Object int[] ($Amount + 1)
    for ($i = 1; $i -le $Amount; $i++) { $dp[$i] = -1 }
    for ($n = 1; $n -le $Amount; $n++) {
        foreach ($c in $Coins) {
            if ($c -le $n -and $dp[$n - $c] -ne -1) {
                if ($dp[$n] -eq -1 -or $dp[$n - $c] + 1 -lt $dp[$n]) {
                    $dp[$n] = $dp[$n - $c] + 1
                }
            }
        }
    }
    return $dp[$Amount]
}

Get-MinCoins -Coins @(1, 2, 5) -Amount 11
