$line = '2024-03-15 ERROR disk full'
if ($line -match '^(?<date>\S+)\s+(?<lvl>\w+)\s+(?<msg>.+)$') {
    "$($Matches.lvl) on $($Matches.date): $($Matches.msg)"
}
