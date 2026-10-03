#!/usr/bin/awk -f
function bin_to_dec(bin,    i, result) {
    result = 0
    for (i = 1; i <= length(bin); i++) {
        result = result * 2 + substr(bin, i, 1)
    }
    return result
}
BEGIN {
    print bin_to_dec("1011")
    print bin_to_dec("11111111")
}
