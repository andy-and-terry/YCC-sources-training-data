"Emirps below 200; expect 15."
"Run with: gst <file>"

| isPrime |
isPrime := [:n |
    n < 2
        ifTrue: [false]
        ifFalse: [((2 to: n sqrt floor) detect: [:d | n \\ d = 0] ifNone: [nil]) isNil]].
(((2 to: 199) select: [:n | | r |
    r := n printString reverse asNumber.
    r ~= n and: [(isPrime value: n) and: [isPrime value: r]]]) size) printNl.
