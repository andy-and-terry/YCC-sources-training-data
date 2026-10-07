function ConvertTo-Square {
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [int]$Number
    )
    process {
        [PSCustomObject]@{
            Number = $Number
            Square = $Number * $Number
        }
    }
}

1..5 | ConvertTo-Square
