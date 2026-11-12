function Get-Square {
    [CmdletBinding()]
    param([Parameter(Mandatory)][ValidateRange(1, 100)][int]$N)
    process { $N * $N }
}
Get-Square -N 9
