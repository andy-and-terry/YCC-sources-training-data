function Get-Area {
    [CmdletBinding(DefaultParameterSetName = 'Rectangle')]
    param(
        [Parameter(ParameterSetName = 'Rectangle', Mandatory)]
        [double]$Width,

        [Parameter(ParameterSetName = 'Rectangle', Mandatory)]
        [double]$Height,

        [Parameter(ParameterSetName = 'Circle', Mandatory)]
        [double]$Radius
    )

    switch ($PSCmdlet.ParameterSetName) {
        'Rectangle' { $Width * $Height }
        'Circle' { [math]::Round([math]::PI * $Radius * $Radius, 2) }
    }
}

"rectangle: $(Get-Area -Width 3 -Height 4)"
"circle: $(Get-Area -Radius 2)"
