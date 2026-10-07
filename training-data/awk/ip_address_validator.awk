#!/usr/bin/awk -f
# Reads candidate IPv4 addresses from stdin and reports which are valid.
function is_valid_ip(ip,    parts, n, i) {
    n = split(ip, parts, ".")
    if (n != 4) return 0
    for (i = 1; i <= 4; i++) {
        if (parts[i] !~ /^[0-9]+$/) return 0
        if (parts[i] < 0 || parts[i] > 255) return 0
        if (length(parts[i]) > 1 && substr(parts[i], 1, 1) == "0") return 0
    }
    return 1
}
{
    print $0 ": " (is_valid_ip($0) ? "valid" : "invalid")
}
