// Fermat primality test; Carmichael number 561 fools it.
def probablyPrime(n: Int): Boolean =
  n > 2 && BigInt(2).modPow(n - 1, n) == BigInt(1)

@main def fermatPrimality(): Unit =
  for n <- List(97, 91, 561) do println(s"$n ${probablyPrime(n)}")
