void main () {
    string s = "banana";
    int n = s.length, i = 0;
    while (i < n) {
        int j = i + 1, k = i;
        while (j < n && s[k] <= s[j]) {
            k = s[k] < s[j] ? i : k + 1;
            j++;
        }
        while (i <= k) {
            print ("%s\n", s.substring (i, j - k));
            i += j - k;
        }
    }
}
