"apple" -eq "APPLE"
"apple" -ceq "APPLE"
5 -gt 3
"abc" -like "a*"
"abc" -notlike "*z"
"2024-03-15" -match '^(\d{4})-(\d{2})-(\d{2})$'
"year is $($Matches[1]), month is $($Matches[2])"

$fruits = "apple", "banana", "cherry"
$fruits -contains "banana"
"kiwi" -in $fruits
$fruits -notcontains "kiwi"

# comparison operators filter arrays
1..10 -gt 7
$fruits -like "*an*"
$fruits -match "^c"

# type tests
42 -is [int]
"text" -isnot [int]
[int]"42" + 1
"42" + 1

# null handling
$null -eq $null
@() -eq $null
$value = $null
if ($null -eq $value) { "value is null" }

# logical operators
(5 -gt 3) -and (2 -gt 1)
(1 -gt 3) -or (2 -gt 1)
-not $true
$true -xor $true
