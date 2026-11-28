List<String> duval(String s) {
    def out = []
    int i = 0, n = s.size()
    while (i < n) {
        int j = i + 1, k = i
        while (j < n && s[k] <= s[j]) {
            k = s[k] < s[j] ? i : k + 1
            j++
        }
        while (i <= k) {
            out << s.substring(i, i + j - k)
            i += j - k
        }
    }
    out
}
println duval('banana')
