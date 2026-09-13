function Set-UserAge {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string]$Name,

        [Parameter(Mandatory)]
        [ValidateRange(0, 120)]
        [int]$Age
    )

    process {
        [PSCustomObject]@{
            Name = $Name
            Age  = $Age
        }
    }
}

"Alice" | Set-UserAge -Age 30
Set-UserAge -Name "Bob" -Age 25

try {
    Set-UserAge -Name "Carol" -Age 200
}
catch {
    Write-Output "validation error: $_"
}
