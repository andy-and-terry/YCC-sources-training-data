string longest_palindrome(string s) {
    var sb = new StringBuilder("#");
    for (int i = 0; i < s.length; i++) {
        sb.append_c(s[i]);
        sb.append_c('#');
    }
    string t = sb.str;
    int n = t.length;
    int[] p = new int[n];
    int center = 0, right = 0;
    int best_len = 0, best_center = 0;

    for (int i = 0; i < n; i++) {
        if (i < right) {
            int mirror = 2 * center - i;
            p[i] = int.min(right - i, p[mirror]);
        }
        while (i - p[i] - 1 >= 0 && i + p[i] + 1 < n && t[i - p[i] - 1] == t[i + p[i] + 1]) {
            p[i]++;
        }
        if (i + p[i] > right) {
            center = i;
            right = i + p[i];
        }
        if (p[i] > best_len) {
            best_len = p[i];
            best_center = i;
        }
    }

    int start = (best_center - best_len) / 2;
    return s.substring(start, best_len);
}

void main() {
    stdout.printf("%s\n", longest_palindrome("babad"));
    stdout.printf("%s\n", longest_palindrome("cbbd"));
}
