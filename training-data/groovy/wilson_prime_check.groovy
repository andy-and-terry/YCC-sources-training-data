// Wilson's theorem primality test.
def wilson(int n) { n >= 2 && (2..<n).inject(1L) { f, i -> f * i % n } == n - 1 }
println((2..19).findAll { wilson(it) })
