void main () {
    string s = "abcabc";
    int k = 3;
    for (int i = 0; i <= s.length - k; i++) {
        long h = 0;
        for (int j = i; j < i + k; j++) h = (h * 31 + s[j]) % 1000003;
        print ("%d %ld\n", i, h);
    }
}
