switch -Regex ('abc123') {
    '^\d+$' { 'digits'; break }
    '\d' { 'has digit' }
    default { 'none' }
}
