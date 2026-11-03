function swap_case(s,    i, c, out) {
    for (i = 1; i <= length(s); i++) {
        c = substr(s, i, 1)
        out = out ((c ~ /[A-Z]/) ? tolower(c) : toupper(c))
    }
    return out
}

BEGIN { print swap_case("Hello World 42") }
