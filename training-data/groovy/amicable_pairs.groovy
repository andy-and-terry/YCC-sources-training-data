// Amicable pairs below 1500 via sums of proper divisors.
def s = { int n -> (1..<n).findAll { n % it == 0 }.sum(0) }

(2..<1500).each { a ->
    def b = s(a)
    if (b > a && s(b) == a) println "$a $b"
}
