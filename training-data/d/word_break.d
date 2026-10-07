import std.stdio;
import std.algorithm;

bool canSegment(string s, string[] dictionary) {
    auto dp = new bool[s.length + 1];
    dp[0] = true;

    for (size_t i = 1; i <= s.length; i++) {
        for (size_t j = 0; j < i; j++) {
            if (dp[j] && dictionary.canFind(s[j .. i])) {
                dp[i] = true;
                break;
            }
        }
    }

    return dp[s.length];
}

void main() {
    string[] dict = ["leet", "code"];
    writeln(canSegment("leetcode", dict));
    writeln(canSegment("leetcodex", dict));
}
