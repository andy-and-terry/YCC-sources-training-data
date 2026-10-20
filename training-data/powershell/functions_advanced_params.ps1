function Get-Greeting {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)][string]$Name,
        [ValidateSet('Hello', 'Hi')][string]$Greeting = 'Hello',
        [ValidateRange(1, 5)][int]$Times = 1,
        [switch]$Shout
    )
    process {
        $msg = (("$Greeting, $Name! ") * $Times).Trim()
        if ($Shout) { $msg.ToUpper() } else { $msg }
    }
}
'Ada', 'Bo' | Get-Greeting -Times 2
Get-Greeting -Name Zed -Greeting Hi -Shout
function Add-All { param([int[]]$Numbers) ($Numbers | Measure-Object -Sum).Sum }
Add-All -Numbers 1, 2, 3
function Test-Splat { param($A, $B) "$A-$B" }
$args1 = @{ A = 1; B = 2 }
Test-Splat @args1
(Get-Command Get-Greeting).Parameters.Keys | Where-Object { $_ -in 'Name', 'Times' }
