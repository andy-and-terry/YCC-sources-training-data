function Get-Greeting {
    param([string]$Name, [string]$Greeting = 'Hello', [switch]$Shout)
    $msg = "$Greeting, $Name"
    if ($Shout) { $msg = $msg.ToUpper() }
    $msg
}

$params = @{
    Name     = 'World'
    Greeting = 'Hi'
    Shout    = $true
}
Get-Greeting @params

$more = @{ Name = 'PowerShell' }
Get-Greeting @more
