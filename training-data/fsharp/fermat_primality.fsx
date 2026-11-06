// Fermat primality test; Carmichael number 561 fools it.
open System.Numerics

let probablyPrime (n: int64) =
    n > 2L && BigInteger.ModPow(BigInteger 2, BigInteger(n - 1L), BigInteger n) = BigInteger.One

for n in [ 97L; 91L; 561L ] do
    printfn "%d %b" n (probablyPrime n)
