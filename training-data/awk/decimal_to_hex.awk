#!/usr/bin/awk -f
function to_hex(n,    digits, out) {
    digits = "0123456789ABCDEF"
    if (n == 0) return "0"
    out = ""
    while (n > 0) {
        out = substr(digits, n % 16 + 1, 1) out
        n = int(n / 16)
    }
    return out
}
{ for (i = 1; i <= NF; i++) printf "%s -> 0x%s\n", $i, to_hex($i) }
