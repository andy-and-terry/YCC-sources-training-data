def fact = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]

boolean isFactorion(int n, List fact) {
    n == n.toString().toList().sum { fact[Integer.parseInt(it)] }
}

println((1..<50000).findAll { isFactorion(it, fact) })
