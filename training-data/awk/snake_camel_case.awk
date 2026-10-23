#!/usr/bin/awk -f
# Convert identifiers between snake_case and camelCase
function to_camel(s,    n, parts, i, out) {
    n = split(s, parts, "_")
    out = parts[1]
    for (i = 2; i <= n; i++)
        out = out toupper(substr(parts[i], 1, 1)) substr(parts[i], 2)
    return out
}
function to_snake(s,    out, i, ch) {
    out = ""
    for (i = 1; i <= length(s); i++) {
        ch = substr(s, i, 1)
        if (ch ~ /[A-Z]/) out = out "_" tolower(ch)
        else out = out ch
    }
    return out
}
BEGIN {
    n = split("user_account_id max_retry_count name", a, " ")
    for (i = 1; i <= n; i++) printf "%-18s -> %s\n", a[i], to_camel(a[i])
    n = split("userAccountId maxRetryCount name", b, " ")
    for (i = 1; i <= n; i++) printf "%-18s -> %s\n", b[i], to_snake(b[i])
}
