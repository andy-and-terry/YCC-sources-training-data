// Narayana's cows N(n)=N(n-1)+N(n-3)
var v = [1, 1, 1]
for i in 3..<10 {
    v.append(v[i - 1] + v[i - 3])
}
print(v.map(String.init).joined(separator: " "))
