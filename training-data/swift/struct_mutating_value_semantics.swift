struct Counter {
    var n = 0
    mutating func bump() { n += 1 }
}

var a = Counter()
var b = a
a.bump(); a.bump()
print(a.n, b.n)
b.bump()
print(b.n)
