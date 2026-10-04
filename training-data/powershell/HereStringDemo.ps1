$name = "Ada"
$total = 3 * 14

# expandable here-string: variables and subexpressions are replaced
$report = @"
Report for $name
Total: $total
Doubled: $($total * 2)
Path: $env:TEMP
"@
$report

# literal here-string: nothing is expanded
$raw = @'
Literal $name and $($total * 2)
Backtick `n stays as written
'@
$raw

# multi-line text is easy to split into lines
$lines = $report -split "`r?`n"
"Line count: $($lines.Count)"
$lines[1]

# embedding JSON without escaping quotes
$json = @'
{ "user": "ada", "roles": ["admin", "dev"] }
'@
$obj = $json | ConvertFrom-Json
$obj.roles -join "/"

# building a template
$template = 'Hello {0}, you owe {1:C2}'
$template -f $name, 12.5
