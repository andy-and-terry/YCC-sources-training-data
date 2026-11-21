"Amicable pairs below 1500 via sums of proper divisors."
| s |
s := [ :n | | t |
    t := 0.
    1 to: n - 1 do: [ :d | (n \\ d) = 0 ifTrue: [ t := t + d ] ].
    t ].

2 to: 1499 do: [ :a | | b |
    b := s value: a.
    (b > a and: [ (s value: b) = a ])
        ifTrue: [ Transcript showCr: a printString, ' ', b printString ] ].
