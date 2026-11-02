function Get-Square {
    [CmdletBinding()]
    param([Parameter(Mandatory, ValueFromPipeline)][int]$N)
    process { $N * $N }
}
1..4 | Get-Square
