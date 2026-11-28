# Rabin-style rolling hash over windows of size 3
BEGIN {
    s = "abcabc"; k = 3; B = 31; M = 1000003
    pw = 1
    for (i = 1; i < k; i++) pw = (pw * B) % M
    for (i = 1; i <= k; i++) h = (h * B + ord(substr(s, i, 1))) % M
    print 1, h
    for (i = 2; i <= length(s) - k + 1; i++) {
        h = (h - ord(substr(s, i - 1, 1)) * pw % M + M) % M
        h = (h * B + ord(substr(s, i + k - 1, 1))) % M
        print i, h
    }
}
function ord(c) { return index("abcdefghijklmnopqrstuvwxyz", c) }
