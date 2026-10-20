$s = 'Hello, World'
$s.ToUpper(); $s.Substring(7); $s.Replace('l', 'L'); $s.Length; $s.IndexOf('o'); $s.Contains('World')
$s -split ', '; 'a,b,,c' -split ','; 'x-y' -replace '-', '+'; 'abc123' -replace '\d', '#'
'abc' -match '^a(b)c$'; $Matches[1]
'Hello' -like 'h*'; 'Hello' -clike 'h*'; 'a' -eq 'A'; 'a' -ceq 'A'
'1,2,3' -split ',' | ForEach-Object { [int]$_ * 2 }
"Name: $($s.ToLower()) Len: $($s.Length)"
'{0:N2} | {1,-6} | {2:D4} | {3:X}' -f 3.14159, 'ab', 42, 255
[regex]::Matches('a1b22c333', '\d+').Value
[regex]::Replace('hello world', '(\w+) (\w+)', '$2 $1')
'one two' -split '\s+' | Measure-Object | Select-Object -ExpandProperty Count
'  pad  '.Trim() + '|'; 'abc'.PadLeft(5, '*'); -join ('a', 'b', 'c'); 'x' * 3
$here = @"
multi $s
"@
$here.Split("`n").Count
'ab' -in @('ab', 'cd'); @('a', 'b') -contains 'a'
