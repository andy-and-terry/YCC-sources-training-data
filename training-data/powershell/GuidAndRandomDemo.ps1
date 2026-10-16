$guid = [guid]::NewGuid()
$guid.ToString().Length
$guid.ToString('N').Length
[guid]::Empty

$rng = [System.Random]::new(42)
$first = 1..3 | ForEach-Object { $rng.Next(1, 100) }
$rng = [System.Random]::new(42)
$second = 1..3 | ForEach-Object { $rng.Next(1, 100) }
"Seeded sequences equal: $((Compare-Object $first $second).Count -eq 0)"

Get-Random -Minimum 5 -Maximum 6
(1..10 | Get-Random -Count 3).Count
'a', 'b', 'c' | Get-Random -SetSeed 7 | Out-Null
