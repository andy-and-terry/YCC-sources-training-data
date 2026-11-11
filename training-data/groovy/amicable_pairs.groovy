// Amicable pairs: d(a) == b and d(b) == a with a != b.
def d = { int n -> (1..<n).findAll { n % it == 0 }.sum(0) }

(2..<1500).each { a ->
    def b = d(a)
    if (b > a && d(b) == a) println "$a $b"
}
