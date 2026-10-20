#!/usr/bin/awk -f
BEGIN { text = "the cat and the dog and the bird the end"; n = split(text, w, " ") }
END { }
BEGIN {
    for (i = 1; i <= n; i++) count[w[i]]++
    for (k in count) keys[++m] = k
    for (i = 2; i <= m; i++) { v = keys[i]; j = i - 1; while (j > 0 && (count[keys[j]] < count[v] || (count[keys[j]] == count[v] && keys[j] > v))) { keys[j + 1] = keys[j]; j-- } keys[j + 1] = v }
    for (i = 1; i <= m; i++) printf "%-5s %d\n", keys[i], count[keys[i]]
}
