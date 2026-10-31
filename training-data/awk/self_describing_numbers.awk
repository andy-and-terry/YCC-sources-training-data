function is_self_describing(s,    i, j, count) {
    for (i = 0; i < length(s); i++) {
        count = 0
        for (j = 1; j <= length(s); j++)
            if (substr(s, j, 1) == i) count++
        if (count != substr(s, i + 1, 1)) return 0
    }
    return 1
}
{
    print $1, is_self_describing($1) ? "true" : "false"
}
