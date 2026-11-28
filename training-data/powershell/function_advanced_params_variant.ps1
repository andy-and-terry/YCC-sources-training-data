function Get-Square {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)][int[]]$Number
    )
    process { foreach ($n in $Number) { $n * $n } }
}
1..4 | Get-Square
