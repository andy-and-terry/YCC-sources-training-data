if ("2024-03-15" -match '(?<y>\d{4})-(?<m>\d\d)-(?<d>\d\d)') {
    "year=$($Matches.y) month=$($Matches.m) day=$($Matches.d)"
}
"a1b22c333" -split '\d+' | Where-Object { $_ }
