$template = @"
Name: {0}
Role: {1}
"@

$people = @(
    [PSCustomObject]@{ Name = "Ada"; Role = "engineer" }
    [PSCustomObject]@{ Name = "*.log"; Role = "wildcard" }
    [PSCustomObject]@{ Name = "42"; Role = "number" }
)

foreach ($person in $people) {
    $template -f $person.Name, $person.Role

    switch -Regex ($person.Name) {
        '^\d+$'   { "  matched: numeric" }
        '\*'      { "  matched: wildcard pattern" }
        default   { "  matched: plain name" }
    }
}
