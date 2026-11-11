// Perrin sequence P(n)=P(n-2)+P(n-3)
var v = [3, 0, 2]
for i in 3..<10 {
    v.append(v[i - 2] + v[i - 3])
}
print(v.map(String.init).joined(separator: " "))
