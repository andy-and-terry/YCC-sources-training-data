#!/usr/bin/awk -f
# Groups each line's word into buckets keyed by its sorted letters.
function sort_letters(word,    n, i, j, chars, temp, key) {
    n = split(word, chars, "")
    for (i = 1; i < n; i++) {
        for (j = 1; j <= n - i; j++) {
            if (chars[j] > chars[j + 1]) {
                temp = chars[j]
                chars[j] = chars[j + 1]
                chars[j + 1] = temp
            }
        }
    }
    key = ""
    for (i = 1; i <= n; i++) key = key chars[i]
    return key
}
{
    key = sort_letters($0)
    if (groups[key] == "") {
        groups[key] = $0
    } else {
        groups[key] = groups[key] "," $0
    }
}
END {
    for (key in groups) {
        print groups[key]
    }
}
