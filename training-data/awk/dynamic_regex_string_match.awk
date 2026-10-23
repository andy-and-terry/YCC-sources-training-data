#!/usr/bin/awk -f
# A string value on the right of ~ is used as a regular expression,
# so the pattern can be built at runtime. Backslashes need doubling.
BEGIN {
    n = split("cat.txt dog.md bird.txt fish", names, " ")
    ext = "txt"
    pattern = "\\." ext "$"        # matches a literal dot, then txt at end

    for (i = 1; i <= n; i++) {
        if (names[i] ~ pattern)
            print names[i], "matches", pattern
        else
            print names[i], "does not match"
    }
}
