BigInteger fact(int n) { (1..n).inject(1G) { a, b -> a * b } }
BigInteger comb(int n, int k) { fact(n) / (fact(k) * fact(n - k)) }
BigInteger lah(int n, int k) { comb(n - 1, k - 1) * fact(n) / fact(k) }

(1..5).each { n -> println((1..n).collect { lah(n, it) }.join(' ')) }
