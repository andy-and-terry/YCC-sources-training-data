#!/usr/bin/awk -f
# Computes the Levenshtein edit distance between two words using DP.
function edit_distance(a, b,    la, lb, i, j, dist, cost) {
    la = length(a)
    lb = length(b)
    for (i = 0; i <= la; i++) dist[i, 0] = i
    for (j = 0; j <= lb; j++) dist[0, j] = j
    for (i = 1; i <= la; i++) {
        for (j = 1; j <= lb; j++) {
            cost = (substr(a, i, 1) == substr(b, j, 1)) ? 0 : 1
            dist[i, j] = dist[i - 1, j] + 1
            if (dist[i, j - 1] + 1 < dist[i, j]) dist[i, j] = dist[i, j - 1] + 1
            if (dist[i - 1, j - 1] + cost < dist[i, j]) dist[i, j] = dist[i - 1, j - 1] + cost
        }
    }
    return dist[la, lb]
}
BEGIN {
    print edit_distance("kitten", "sitting")
    print edit_distance("flaw", "lawn")
}
