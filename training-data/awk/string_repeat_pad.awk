#!/usr/bin/awk -f
function repeat(s, n,    out) {
    out = ""
    while (n-- > 0) out = out s
    return out
}
function center(s, width,    pad, left) {
    pad = width - length(s)
    if (pad <= 0) return s
    left = int(pad / 2)
    return repeat(" ", left) s repeat(" ", pad - left)
}
BEGIN { width = 20 }
{
    print "[" center($0, width) "]"
}
END {
    print repeat("=", width + 2)
}
