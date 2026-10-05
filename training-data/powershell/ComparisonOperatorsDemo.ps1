'apple' -eq 'APPLE'
'apple' -ceq 'APPLE'
'abc' -like 'a*'
'abc' -match '^a(.)c$'
$Matches[1]
5 -in 1..10
1, 2, 3 -contains 2
(1, 2, 3, 4, 5) -gt 3
'a,b,c' -split ','
'x' * 3
$null -eq $undefined
10 -is [int]
'a-b' -replace '-', '+'
