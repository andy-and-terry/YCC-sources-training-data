"Positive n expressible as a*a + b*b with a, b >= 0."
| representable |
representable := [ :n | | found |
    found := false.
    0 to: 6 do: [ :a |
        a to: 6 do: [ :b |
            ((a * a) + (b * b)) = n ifTrue: [ found := true ] ] ].
    found ].

1 to: 30 do: [ :n |
    (representable value: n) ifTrue: [ Transcript show: n printString; show: ' ' ] ].
Transcript cr.
