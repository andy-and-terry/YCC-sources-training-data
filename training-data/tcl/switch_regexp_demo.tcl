proc classifyToken {token} {
    switch -regexp -- $token {
        {^[0-9]+$} { return "integer" }
        {^[0-9]+\.[0-9]+$} { return "float" }
        {^[A-Za-z_][A-Za-z0-9_]*$} { return "identifier" }
        {^".*"$} { return "string" }
        default { return "unknown" }
    }
}

foreach token {42 3.14 total_sum "hello world" $$$} {
    puts "$token -> [classifyToken $token]"
}
