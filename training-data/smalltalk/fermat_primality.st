"Fermat primality test; Carmichael number 561 fools it."
| probablyPrime |
probablyPrime := [:n | n > 2 and: [(2 raisedTo: n - 1 modulo: n) = 1]].
#(97 91 561) do: [:n |
    Transcript showCr: n printString, ' ', (probablyPrime value: n) printString].
