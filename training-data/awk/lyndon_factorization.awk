BEGIN {
    s = "banana"; n = length(s); i = 1
    while (i <= n) {
        j = i + 1; k = i
        while (j <= n && substr(s, k, 1) <= substr(s, j, 1)) {
            k = (substr(s, k, 1) < substr(s, j, 1)) ? i : k + 1
            j++
        }
        while (i <= k) {
            len = j - k
            print substr(s, i, len)
            i += len
        }
    }
}
