let s = Array("abcabc".utf8).map { Int($0) }
let k = 3, B = 31, M = 1000003
var pw = 1
for _ in 1..<k { pw = pw * B % M }
var h = s[0..<k].reduce(0) { ($0 * B + $1) % M }
print(0, h)
for i in 1...(s.count - k) {
    h = (h - s[i - 1] * pw % M + M) % M
    h = (h * B + s[i + k - 1]) % M
    print(i, h)
}
