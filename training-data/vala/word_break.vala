bool word_break(string s, Gee.HashSet<string> words) {
    int n = s.length;
    bool[] dp = new bool[n + 1];
    dp[0] = true;

    for (int end = 1; end <= n; end++) {
        for (int start = 0; start < end; start++) {
            if (dp[start] && words.contains(s.substring(start, end - start))) {
                dp[end] = true;
                break;
            }
        }
    }
    return dp[n];
}

void main() {
    var words = new Gee.HashSet<string>();
    words.add("leet");
    words.add("code");

    stdout.printf("%s\n", word_break("leetcode", words).to_string());

    var words2 = new Gee.HashSet<string>();
    words2.add("cats");
    words2.add("dog");
    words2.add("sand");
    words2.add("and");
    words2.add("cat");

    stdout.printf("%s\n", word_break("catsandog", words2).to_string());
}
