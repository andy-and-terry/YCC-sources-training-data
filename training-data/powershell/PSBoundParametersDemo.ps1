# $PSBoundParameters lists only the parameters the caller actually supplied.

function Get-Report {
    [CmdletBinding()]
    param(
        [string]$Name = 'default',
        [int]$Count = 5,
        [switch]$Verbose2
    )

    Write-Host "Bound keys: $($PSBoundParameters.Keys | Sort-Object)"

    if ($PSBoundParameters.ContainsKey('Count')) {
        Write-Host "Count was passed explicitly: $Count"
    } else {
        Write-Host "Count came from its default: $Count"
    }
}

function Invoke-Wrapper {
    param(
        [string]$Name = 'wrapped',
        [int]$Count = 1
    )
    # forward whatever the caller gave us, leave the rest to defaults
    Get-Report @PSBoundParameters
}

Get-Report
Get-Report -Name 'sales' -Count 9
Get-Report -Verbose2

Write-Host '--- wrapper ---'
Invoke-Wrapper -Count 3

# add or remove entries before splatting
function Invoke-Modified {
    param([string]$Name = 'x', [int]$Count = 2)
    $PSBoundParameters['Name'] = $Name.ToUpper()
    $null = $PSBoundParameters.Remove('Count')
    Get-Report @PSBoundParameters
}
Write-Host '--- modified ---'
Invoke-Modified -Name 'abc' -Count 7
