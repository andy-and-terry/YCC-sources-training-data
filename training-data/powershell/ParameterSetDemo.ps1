function Get-Item2 {
    [CmdletBinding(DefaultParameterSetName = 'ByName')]
    param(
        [Parameter(ParameterSetName = 'ByName', Mandatory)]
        [string]$Name,

        [Parameter(ParameterSetName = 'ById', Mandatory)]
        [int]$Id,

        [Parameter()]
        [switch]$Detailed
    )
    switch ($PSCmdlet.ParameterSetName) {
        'ByName' { $result = "name=$Name" }
        'ById'   { $result = "id=$Id" }
    }
    if ($Detailed) { $result += ' (detailed)' }
    $result
}

Get-Item2 -Name 'widget'
Get-Item2 -Id 42 -Detailed
