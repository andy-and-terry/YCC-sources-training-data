switch -Regex ("abc123") {
    '^\d+$'   { "digits only"; break }
    '\d'      { "contains digit" }
    '^[a-z]+' { "starts with letters" }
}
