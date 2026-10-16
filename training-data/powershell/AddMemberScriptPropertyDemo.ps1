$circle = [PSCustomObject]@{ Radius = 3 }

$circle | Add-Member -MemberType ScriptProperty -Name Area -Value { [Math]::PI * $this.Radius * $this.Radius }
$circle | Add-Member -MemberType ScriptMethod -Name Scale -Value {
    param([double]$factor)
    $this.Radius *= $factor
}
$circle | Add-Member -MemberType NoteProperty -Name Unit -Value 'cm'
$circle | Add-Member -MemberType AliasProperty -Name R -Value Radius

'{0:N2} {1}^2' -f $circle.Area, $circle.Unit
$circle.Scale(2)
'{0:N2} {1}^2 (R={2})' -f $circle.Area, $circle.Unit, $circle.R
$circle | Get-Member -MemberType ScriptProperty, ScriptMethod, NoteProperty, AliasProperty | Select-Object Name, MemberType
