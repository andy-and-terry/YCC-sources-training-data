function Set-Backup {
    [CmdletBinding()]
    param(
        # ValidateScript runs a script block; $_ is the supplied value.
        [Parameter(Mandatory)]
        [ValidateScript({
            if ($_ % 2 -eq 0) { $true }
            else { throw "Count '$_' must be even." }
        })]
        [int]$Count,

        [ValidateScript({ $_ -match '^[a-z]+$' })]
        [string]$Tag = 'daily',

        [ValidateNotNullOrEmpty()]
        [string]$Label = 'default'
    )
    "Backing up $Count items tagged '$Tag' ($Label)"
}

Set-Backup -Count 4
Set-Backup -Count 10 -Tag weekly

foreach ($callArgs in @(@{ Count = 3 }, @{ Count = 2; Tag = 'BAD1' })) {
    try {
        Set-Backup @callArgs
    }
    catch {
        Write-Output "Rejected: $($_.Exception.Message.Split([Environment]::NewLine)[0])"
    }
}
