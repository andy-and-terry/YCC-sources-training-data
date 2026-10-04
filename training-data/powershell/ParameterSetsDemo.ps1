function Get-Greeting {
    [CmdletBinding(DefaultParameterSetName = 'ByName')]
    param(
        [Parameter(ParameterSetName = 'ByName', Mandatory, Position = 0)]
        [string]$Name,

        [Parameter(ParameterSetName = 'ById', Mandatory)]
        [int]$Id,

        [Parameter(ParameterSetName = 'ByName')]
        [Parameter(ParameterSetName = 'ById')]
        [switch]$Shout
    )

    $text = switch ($PSCmdlet.ParameterSetName) {
        'ByName' { "Hello, $Name" }
        'ById' { "Hello, user #$Id" }
    }
    if ($Shout) { $text.ToUpper() } else { $text }
}

Get-Greeting "Ada"
Get-Greeting -Id 42
Get-Greeting -Name "Bob" -Shout
Get-Greeting -Id 7 -Shout

try {
    Get-Greeting -Name "Ada" -Id 5
} catch {
    "conflict: parameters from different sets cannot be combined"
}
