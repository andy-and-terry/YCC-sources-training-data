function Swap-Case([string]$s) {
    -join ($s.ToCharArray() | ForEach-Object {
        if ([char]::IsUpper($_)) { [char]::ToLower($_) } else { [char]::ToUpper($_) }
    })
}

Swap-Case "Hello World 42"
