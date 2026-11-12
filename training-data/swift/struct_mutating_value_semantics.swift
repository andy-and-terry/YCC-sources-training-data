struct Counter { var n = 0; mutating func inc() { n += 1 } }
var a = Counter(); var b = a
a.inc(); a.inc()
print(a.n, b.n)
