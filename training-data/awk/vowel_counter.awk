BEGIN {
    s = tolower("Education is beautiful")
    for (i = 1; i <= length(s); i++) {
        c = substr(s, i, 1)
        if (c ~ /[aeiou]/) counts[c]++
    }
    split("a e i o u", order, " ")
    for (i = 1; i <= 5; i++) printf "%s=%d ", order[i], counts[order[i]]
    print ""
}
