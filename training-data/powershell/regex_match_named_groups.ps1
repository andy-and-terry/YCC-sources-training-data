$s = 'user=ann id=42'
if ($s -match 'user=(?<u>\w+)\s+id=(?<id>\d+)') {
    "$($Matches.u) / $($Matches.id)"
}
'a1b22c333' -replace '\d+', '#'
'x,y,z' -split ','
