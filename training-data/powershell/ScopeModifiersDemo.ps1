$global:level = 'global'
$script:level2 = 'script'
$local = 'top'

function Show-Scopes {
    $local = 'inside function'
    "local: $local"
    "parent: $((Get-Variable local -Scope 1).Value)"
    "global: $global:level"
    $script:level2 = 'changed by function'
}

Show-Scopes
"after: $script:level2"

$counter = 0
1..3 | ForEach-Object { $counter++ }
"counter: $counter"

function Add-One { $counter++; "inner: $counter" }
Add-One
"outer: $counter"
