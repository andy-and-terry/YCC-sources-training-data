$mod = New-Module -Name Demo -ScriptBlock {
    $script:calls = 0
    function Invoke-Demo { $script:calls++; "call $script:calls" }
    function Get-Calls { $script:calls }
    Export-ModuleMember -Function Invoke-Demo, Get-Calls
} -AsCustomObject
$mod.Invoke-Demo 2>$null
Import-Module (New-Module -Name M2 -ScriptBlock { function Hello { 'hello from module' } }) -Force
Hello
Get-Command Hello | Select-Object -ExpandProperty ModuleName
Get-PSDrive -PSProvider FileSystem | Select-Object -First 1 | ForEach-Object { $_.Name.Length -gt 0 }
New-Item -Path Variable:\Demo -Value 5 | Out-Null; $Demo; Remove-Item Variable:\Demo
Set-Variable -Name dyn -Value 10 -Scope Script; Get-Variable dyn -ValueOnly
Get-Alias ls | Select-Object -ExpandProperty Definition
Set-Alias -Name ll -Value Get-ChildItem; (Get-Alias ll).Definition
(Get-Verb | Where-Object Verb -eq 'Get').Verb
Get-Member -InputObject 'str' -Name ToUpper | Select-Object -ExpandProperty MemberType
