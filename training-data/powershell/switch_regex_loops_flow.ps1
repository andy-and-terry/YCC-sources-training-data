switch -Regex ('abc123') { '^\d' { 'starts with digit' } '\d+$' { 'ends with digits' } default { 'neither' } }
switch (3) { 1 { 'one' } { $_ -gt 2 } { 'greater than two' } default { 'other' } }
switch -Wildcard ('file.txt') { '*.txt' { 'text' } '*.md' { 'markdown' } }
foreach ($i in 1..3) { if ($i -eq 2) { continue }; "item $i" }
for ($i = 0; $i -lt 3; $i++) { $i * $i }
$n = 0; while ($n -lt 3) { $n++ }; $n
do { $n-- } until ($n -le 0); $n
1..10 | ForEach-Object { if ($_ -gt 3) { return }; $_ }
:outer foreach ($a in 1..3) { foreach ($b in 1..3) { if ($a * $b -eq 4) { break outer } } }
$x = if ($n -eq 0) { 'zero' } else { 'nonzero' }; $x
$null -eq $undefined; $true -and -not $false; 5 -gt 3 -or $false
[int]'42' + [double]'1.5'; [bool]'false'; [bool]''; [string]123
0.1 + 0.2 -eq 0.3; [math]::Round(2.5); [math]::Round(3.5); [math]::Floor(-2.5); 7 % 3; [math]::Pow(2, 10); 7 / 2; [int](7 / 2); 7 -shr 1
