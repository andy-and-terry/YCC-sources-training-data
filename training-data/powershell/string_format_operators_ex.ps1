'{0} is {1:N1}% done' -f 'task', 42.567
'a,b,c' -split ',' | ForEach-Object { $_.ToUpper() }
('x', 'y') -join '-'
'hello world' -replace 'o', '0'
'abc123' -match '(\d+)' | Out-Null; $Matches[1]
'file.TXT' -like '*.txt'
