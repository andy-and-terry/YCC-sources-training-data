if ('v2.10.4' -match '^v(?<maj>\d+)\.(?<min>\d+)\.(?<pat>\d+)$') {
    "$($Matches.maj) / $($Matches.min) / $($Matches.pat)"
}
