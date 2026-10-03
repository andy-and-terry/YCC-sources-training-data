string expand_around_center(string s, int left, int right) {
    int n = s.length;
    while (left >= 0 && right < n && s[left] == s[right]) {
        left--;
        right++;
    }
    return s.substring(left + 1, right - left - 1);
}

string longest_palindromic_substring(string s) {
    string best = "";
    for (int i = 0; i < s.length; i++) {
        string odd = expand_around_center(s, i, i);
        if (odd.length > best.length) {
            best = odd;
        }
        string even = expand_around_center(s, i, i + 1);
        if (even.length > best.length) {
            best = even;
        }
    }
    return best;
}

void main() {
    stdout.printf("%s\n", longest_palindromic_substring("babad"));
    stdout.printf("%s\n", longest_palindromic_substring("cbbd"));
}
