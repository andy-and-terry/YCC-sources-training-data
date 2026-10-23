function Invoke-Wrapper {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, Position = 0)]
        [string]$Command,

        # Collects every unbound argument, like "$@" in a shell wrapper
        [Parameter(ValueFromRemainingArguments)]
        [string[]]$Rest
    )
    Write-Output "Command : $Command"
    Write-Output "Count   : $($Rest.Count)"
    Write-Output ("Rest    : " + ($Rest -join ' | '))
}

Invoke-Wrapper build --release --target x64
Invoke-Wrapper clean

# OutputType documents what the function returns
function Get-Pair {
    [OutputType([System.Collections.Hashtable])]
    param([int]$A, [int]$B)
    @{ Sum = $A + $B; Product = $A * $B }
}

$p = Get-Pair 6 7
Write-Output "Sum=$($p.Sum) Product=$($p.Product)"
Write-Output ("Declared: " + (Get-Command Get-Pair).OutputType.Name)
