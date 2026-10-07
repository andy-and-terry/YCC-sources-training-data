[int]'42' + 1
[int]3.7
[int][math]::Floor(3.7)
[double]'1e3'
[string]123 + '4'
[bool]'false'
[bool]''
[char]65
[int][char]'a'
[byte[]][char[]]'Hi'
[datetime]'2024-12-25' | Get-Date -Format 'dddd'
[int[]]('1', '2', '3') | Measure-Object -Sum | Select-Object -ExpandProperty Sum
'abc' -as [int]
'10' -as [int]
(1.5).GetType().Name
42 -is [int]
