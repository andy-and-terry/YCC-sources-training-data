"Circular primes below 100; expect 13."
"Run with: gst <file>"

| isPrime |
isPrime := [:n |
    n < 2
        ifTrue: [false]
        ifFalse: [((2 to: n sqrt floor) detect: [:d | n \\ d = 0] ifNone: [nil]) isNil]].
(((2 to: 99) select: [:n | | s |
    s := n printString.
    (0 to: s size - 1) allSatisfy: [:i |
        isPrime value: ((s copyFrom: i + 1), (s copyFrom: 1 to: i)) asNumber]]) size) printNl.
