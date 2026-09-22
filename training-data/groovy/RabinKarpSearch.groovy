class RabinKarpSearch {
    static final int BASE = 256
    static final int MOD = 1000000007

    static List<Integer> search(String text, String pattern) {
        def matches = []
        int n = text.length()
        int m = pattern.length()
        if (m > n || m == 0) return matches

        long highOrder = 1
        for (int i = 0; i < m - 1; i++) {
            highOrder = (highOrder * BASE) % MOD
        }

        long patternHash = 0
        long windowHash = 0
        for (int i = 0; i < m; i++) {
            patternHash = (patternHash * BASE + (int) pattern.charAt(i)) % MOD
            windowHash = (windowHash * BASE + (int) text.charAt(i)) % MOD
        }

        for (int i = 0; i <= n - m; i++) {
            if (patternHash == windowHash && text.substring(i, i + m) == pattern) {
                matches << i
            }
            if (i < n - m) {
                windowHash = (windowHash - (int) text.charAt(i) * highOrder % MOD + MOD) % MOD
                windowHash = (windowHash * BASE + (int) text.charAt(i + m)) % MOD
            }
        }
        return matches
    }
}

println RabinKarpSearch.search("abxabcabcaby", "abc")
