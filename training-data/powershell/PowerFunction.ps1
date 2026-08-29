function Get-Power {
    param([int]$Base, [int]$Exp)

    if ($Exp -eq 0) { return 1 }
    if ($Exp % 2 -eq 0) {
        $half = Get-Power $Base ($Exp / 2)
        return $half * $half
    }
    return $Base * (Get-Power $Base ($Exp - 1))
}

Get-Power -Base 2 -Exp 10
Get-Power -Base 3 -Exp 5
