function Describe-Value {
    param($Value)
    switch ($Value) {
        { $_ -is [int] -and $_ -lt 0 } { "negative integer"; break }
        0 { "zero"; break }
        { $_ -is [int] } { "positive integer"; break }
        { $_ -is [string] -and $_.Length -eq 0 } { "empty string"; break }
        default { "something else: $($Value.GetType().Name)" }
    }
}

Describe-Value -5
Describe-Value 0
Describe-Value 42
Describe-Value ""
Describe-Value 3.14

# wildcard and regex matching
foreach ($file in "report.txt", "image.PNG", "data2024.csv", "notes") {
    switch -Wildcard ($file) {
        "*.txt" { "$file is text" }
        "*.png" { "$file is an image" }
        "*.csv" { "$file is a table" }
        default { "$file has no known extension" }
    }
}

switch -Regex ("order-1234") {
    '^order-(\d+)$' { "order number: $($Matches[1])" }
}

# without break, every matching clause runs
switch (5) {
    { $_ -gt 1 } { "greater than 1" }
    { $_ -gt 4 } { "greater than 4" }
    { $_ -gt 9 } { "greater than 9" }
}
