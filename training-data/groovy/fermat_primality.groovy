// Fermat primality test; Carmichael number 561 fools it.
boolean probablyPrime(long n) {
    n > 2 && BigInteger.TWO.modPow(BigInteger.valueOf(n - 1), BigInteger.valueOf(n)) == BigInteger.ONE
}

[97L, 91L, 561L].each { println "$it ${probablyPrime(it)}" }
