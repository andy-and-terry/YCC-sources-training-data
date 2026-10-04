"abc" -eq "ABC"
"abc" -ceq "ABC"
"hello world" -like "hello*"
"hello" -match "^h(.)l"
$Matches[1]
1, 2, 3 -contains 2
2 -in 1, 2, 3
5 -gt 3 -and 2 -lt 4
"b" -ne "a"
(1, 2, 3, 4) -gt 2
$null -eq $undefined
