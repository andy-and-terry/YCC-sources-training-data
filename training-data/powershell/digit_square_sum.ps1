function Get-DigitSquareSum([int]$n) {
    ([string][math]::Abs($n)).ToCharArray() |
        ForEach-Object { [int]::Parse($_) * [int]::Parse($_) } |
        Measure-Object -Sum |
        Select-Object -ExpandProperty Sum
}

Get-DigitSquareSum 123
Get-DigitSquareSum -99
