function add_binary(a, b,    i, j, carry, sum, out) {
    i = length(a); j = length(b); carry = 0; out = ""
    while (i > 0 || j > 0 || carry) {
        sum = carry
        if (i > 0) sum += substr(a, i--, 1)
        if (j > 0) sum += substr(b, j--, 1)
        out = (sum % 2) out
        carry = int(sum / 2)
    }
    return out
}
BEGIN { print add_binary("1010", "1011") }   # 10101
