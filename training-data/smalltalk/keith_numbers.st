"Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits."
| isKeith |
isKeith := [ :n | | seq k sum |
    seq := OrderedCollection new.
    n printString do: [ :c | seq add: c digitValue ].
    k := seq size.
    [ seq last < n ] whileTrue: [
        sum := 0.
        (seq size - k + 1) to: seq size do: [ :i | sum := sum + (seq at: i) ].
        seq add: sum ].
    seq last = n ].

10 to: 1199 do: [ :n |
    (isKeith value: n) ifTrue: [ Transcript show: n printString; show: ' ' ] ].
Transcript cr.
