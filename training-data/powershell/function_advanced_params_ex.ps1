function Get-Square {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)][int[]]$Number,
        [ValidateRange(1, 10)][int]$Power = 2
    )
    process { foreach ($n in $Number) { [math]::Pow($n, $Power) } }
}
1, 2, 3 | Get-Square -Power 3
