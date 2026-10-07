function Remove-TempThing {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Medium')]
    param([Parameter(Mandatory)][string[]]$Name)

    foreach ($n in $Name) {
        if ($PSCmdlet.ShouldProcess($n, 'Delete')) {
            "Deleted $n"
        }
    }
}

Remove-TempThing -Name a, b -WhatIf
Remove-TempThing -Name c -Confirm:$false
