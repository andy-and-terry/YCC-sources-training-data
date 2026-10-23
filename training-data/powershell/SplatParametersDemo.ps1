function Get-Greeting {
    param([string]$Name, [string]$Greeting = 'Hello', [switch]$Shout)
    $s = "$Greeting, $Name"
    if ($Shout) { $s.ToUpper() } else { $s }
}

$args1 = @{ Name = 'Ann'; Greeting = 'Hi' }
Get-Greeting @args1
$args1.Shout = $true
Get-Greeting @args1
