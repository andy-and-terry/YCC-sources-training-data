"Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n."
| isPrime isCarmichael |
isPrime := [ :n |
    n > 1 and: [ ((2 to: n sqrtFloor) allSatisfy: [ :p | (n \\ p) ~= 0 ]) ] ].

isCarmichael := [ :n |
    (isPrime value: n) not and: [
        (2 to: n - 1) allSatisfy: [ :a |
            (a gcd: n) ~= 1 or: [ (a raisedTo: n - 1 modulo: n) = 1 ] ] ] ].

3 to: 2999 by: 2 do: [ :n |
    (isCarmichael value: n) ifTrue: [ Transcript show: n printString; show: ' ' ] ].
Transcript cr.
