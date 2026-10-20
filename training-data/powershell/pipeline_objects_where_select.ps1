$procs = @(
    [pscustomobject]@{ Name = 'a'; Cpu = 10; Group = 'x' },
    [pscustomobject]@{ Name = 'b'; Cpu = 50; Group = 'y' },
    [pscustomobject]@{ Name = 'c'; Cpu = 30; Group = 'x' }
)
$procs | Where-Object { $_.Cpu -gt 20 } | Select-Object Name, Cpu | Format-Table | Out-String | Write-Output
$procs | Sort-Object Cpu -Descending | Select-Object -First 2 -ExpandProperty Name
$procs | Group-Object Group | ForEach-Object { "{0}: {1}" -f $_.Name, $_.Count }
$procs | Measure-Object Cpu -Sum -Average -Maximum | Select-Object Sum, Average, Maximum
($procs | ForEach-Object { $_.Cpu * 2 }) -join ','
$procs.Where({ $_.Group -eq 'x' }).Name
$procs.ForEach({ $_.Name.ToUpper() })
