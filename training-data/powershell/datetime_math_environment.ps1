$d = [datetime]'2024-02-28 12:30:00'
$d.AddDays(2).ToString('yyyy-MM-dd'); $d.DayOfWeek; $d.DayOfYear; [datetime]::IsLeapYear(2024)
($d.AddMonths(1) - $d).Days
New-TimeSpan -Start $d -End $d.AddHours(30) | Select-Object -ExpandProperty TotalHours
[timespan]::FromMinutes(90).ToString()
Get-Date -Year 2024 -Month 1 -Day 1 -Hour 0 -Minute 0 -Second 0 | ForEach-Object { $_.ToString('o').Substring(0, 10) }
[datetime]::ParseExact('05/03/2024', 'dd/MM/yyyy', $null).Month
$env:PATH.Length -gt 0; $env:HOME_X = 'set'; $env:HOME_X; Remove-Item Env:HOME_X
[Environment]::GetEnvironmentVariable('NOPE_X') -eq $null
$PSVersionTable.PSVersion.Major -ge 5
[guid]::NewGuid().ToString().Length; [Math]::Abs(-5); [Math]::Max(3, 9); [Math]::Sqrt(144)
Get-Random -Minimum 5 -Maximum 6
'{0:yyyy}' -f $d; $d.ToUniversalTime().Kind
(1..5 | Measure-Object -Sum).Sum; [System.IO.Path]::GetExtension('a/b.txt')
