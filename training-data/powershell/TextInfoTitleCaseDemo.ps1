$textInfo = (Get-Culture).TextInfo

$textInfo.ToTitleCase('the quick brown fox')
$textInfo.ToTitleCase('SHOUTING STAYS UPPER')
$textInfo.ToTitleCase('SHOUTING BECOMES TITLE'.ToLower())
$textInfo.ToUpper('mixed Case')

'snake_case_name' -split '_' | ForEach-Object { $textInfo.ToTitleCase($_) } | Join-String -Separator ''
'  padded  '.Trim().ToUpperInvariant()
