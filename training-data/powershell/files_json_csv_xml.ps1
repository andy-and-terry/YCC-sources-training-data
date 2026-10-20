$tmp = Join-Path ([System.IO.Path]::GetTempPath()) 'ps_demo'
New-Item -ItemType Directory -Path $tmp -Force | Out-Null
$obj = [pscustomobject]@{ name = 'Ada'; tags = @('a', 'b'); nested = @{ x = 1 } }
$json = $obj | ConvertTo-Json -Depth 3 -Compress
$json
($json | ConvertFrom-Json).tags.Count
$csvPath = Join-Path $tmp 'data.csv'
@([pscustomobject]@{ id = 1; n = 'a' }, [pscustomobject]@{ id = 2; n = 'b' }) | Export-Csv $csvPath -NoTypeInformation
Import-Csv $csvPath | ForEach-Object { "$($_.id):$($_.n)" }
Set-Content -Path (Join-Path $tmp 'a.txt') -Value 'l1', 'l2', 'l3'
Add-Content -Path (Join-Path $tmp 'a.txt') -Value 'l4'
(Get-Content (Join-Path $tmp 'a.txt')).Count
Get-Content (Join-Path $tmp 'a.txt') -TotalCount 2
Select-String -Path (Join-Path $tmp 'a.txt') -Pattern 'l[23]' | ForEach-Object Line
[xml]$xml = '<r><i id="1">a</i><i id="2">b</i></r>'
$xml.r.i | ForEach-Object { $_.id + $_.'#text' }
Get-ChildItem $tmp | Select-Object -ExpandProperty Name | Sort-Object
Test-Path $csvPath
Remove-Item $tmp -Recurse -Force
Test-Path $tmp
