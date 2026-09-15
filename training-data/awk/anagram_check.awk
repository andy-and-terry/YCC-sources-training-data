#!/usr/bin/awk -f
# Checks whether the first two fields of each line are anagrams of each other.
function sorted_chars(word,    n, i, j, chars, temp, key) {
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
    if (sorted_chars($1) == sorted_chars($2)) {
        print $1, $2, "yes"
    } else {
        print $1, $2, "no"
    }
}
