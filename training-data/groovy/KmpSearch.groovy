def buildLps(String pattern) {
    int n = pattern.length()
    def lps = new int[n]
    int len = 0
    int i = 1
    while (i < n) {
        if (pattern[i] == pattern[len]) {
            len++
            lps[i] = len
            i++
        } else if (len != 0) {
            len = lps[len - 1]
        } else {
            lps[i] = 0
            i++
        }
    }
    return lps
}

def kmpSearch(String text, String pattern) {
    def lps = buildLps(pattern)
    int n = text.length()
    int m = pattern.length()
    int i = 0, j = 0
    while (i < n) {
        if (text[i] == pattern[j]) {
            i++
            j++
            if (j == m) return i - j
        } else if (j > 0) {
            j = lps[j - 1]
        } else {
            i++
        }
    }
    return -1
}

println kmpSearch("abxabcabcaby", "abcaby")
