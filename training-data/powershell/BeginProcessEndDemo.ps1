function Get-RunningTotal {
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [int]$Value
    )

    begin {
        Write-Output "starting accumulation"
        $script:total = 0
    }

    process {
        $script:total += $Value
        Write-Output "running total: $script:total"
    }

    end {
        Write-Output "final total: $script:total"
    }
}

1..5 | Get-RunningTotal
