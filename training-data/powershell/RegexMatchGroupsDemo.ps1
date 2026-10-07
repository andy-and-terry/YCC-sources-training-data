$log = "2024-03-09 ERROR [db] connection lost (code=503)"

if ($log -match '^(?<date>[\d-]+) (?<level>\w+) \[(?<src>\w+)\] .*code=(?<code>\d+)') {
    "date:  $($Matches.date)"
    "level: $($Matches.level)"
    "src:   $($Matches.src)"
    "code:  $($Matches.code)"
}

$text = "a1 b22 c333"
$all = [regex]::Matches($text, '[a-z](\d+)')
foreach ($m in $all) {
    "$($m.Value) -> digits $($m.Groups[1].Value)"
}

$text -replace '\d+', '#'
$text -replace '([a-z])(\d+)', '$2$1'
"a,b;c" -split '[,;]'
"abc" -cmatch 'ABC'
