function Get-Square {
    [CmdletBinding()]
    param([Parameter(Mandatory, ValueFromPipeline)][int]$Number)
    process { $Number * $Number }
}
1..4 | Get-Square
