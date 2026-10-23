function Show-Bound {
    [CmdletBinding()]
    param(
        [string]$Name = 'default',
        [int]$Count = 1,
        [switch]$Force
    )

    "Bound parameters:"
    foreach ($key in $PSBoundParameters.Keys | Sort-Object) {
        "  {0} = {1}" -f $key, $PSBoundParameters[$key]
    }

    if ($PSBoundParameters.ContainsKey('Count')) {
        "Count was supplied explicitly"
    } else {
        "Count used its default ($Count)"
    }
}

function Invoke-Wrapper {
    param([string]$Name, [int]$Count)
    # Forward only what the caller actually passed
    Show-Bound @PSBoundParameters
}

function Show-Args {
    "Received $($args.Count) extra arguments: $($args -join ', ')"
}

Show-Bound -Name 'alpha' -Force
Invoke-Wrapper -Count 5
Show-Args 1 two 3.0
