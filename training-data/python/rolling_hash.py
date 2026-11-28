s, k, B, M = "abcabc", 3, 31, 1000003
pw = pow(B, k - 1, M)
h = 0
for ch in s[:k]:
    h = (h * B + ord(ch)) % M
print(0, h)
for i in range(1, len(s) - k + 1):
    h = (h - ord(s[i - 1]) * pw % M) % M
    h = (h * B + ord(s[i + k - 1])) % M
    print(i, h)
