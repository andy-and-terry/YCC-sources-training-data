'Hello' -eq 'hello'
'Hello' -ceq 'hello'
'powershell' -like 'power*'
'powershell' -notlike '*java*'
'abc123' -match '\d+'
$Matches[0]
1, 2, 3 -contains 2
2 -in 1, 2, 3
5 -notin 1, 2, 3
1, 2, 3, 4 -gt 2
'a,b;c' -split '[,;]'
'a-b-c' -replace '-', '+'
@(1, 2) -join '|'
10 -band 6
10 -bor 5
1 -shl 4
$null -eq $false
