$params = @{ Path = '.'; Filter = '*.ps1'; Recurse = $true }
Get-ChildItem @params | Select-Object -First 2 FullName
$h = [ordered]@{ a = 1; b = 2 }
$h['c'] = 3
$h.GetEnumerator() | ForEach-Object { "$($_.Key)=$($_.Value)" }
