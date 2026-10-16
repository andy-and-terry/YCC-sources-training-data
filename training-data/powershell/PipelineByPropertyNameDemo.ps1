function Get-Greeting {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [string]$Name,

        [Parameter(ValueFromPipelineByPropertyName)]
        [Alias('Town')]
        [string]$City = 'nowhere'
    )
    process {
        "Hello $Name from $City"
    }
}

$people = @(
    [PSCustomObject]@{ Name = 'Ana'; City = 'Porto' }
    [PSCustomObject]@{ Name = 'Ben'; Town = 'Leeds' }
    [PSCustomObject]@{ Name = 'Cleo' }
)
$people | Get-Greeting
