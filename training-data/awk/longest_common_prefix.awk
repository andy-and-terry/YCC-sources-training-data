#!/usr/bin/awk -f
function common_prefix(words, n,    prefix, i, w) {
    prefix = words[1]
    for (i = 2; i <= n; i++) {
        w = words[i]
        while (index(w, prefix) != 1 && length(prefix) > 0) {
            prefix = substr(prefix, 1, length(prefix) - 1)
        }
    }
    return prefix
}
BEGIN {
    split("flower flow flight", words, " ")
    result = common_prefix(words, 3)
    print (result == "" ? "(none)" : result)
}
