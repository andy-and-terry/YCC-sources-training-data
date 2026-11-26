"Primorials up to 1e6, including 1; expect 8."
"Run with: gst <file>"

| isPrime |
isPrime := [:n |
    n < 2
        ifTrue: [false]
        ifFalse: [((2 to: n sqrt floor) detect: [:d | n \\ d = 0] ifNone: [nil]) isNil]].
| values acc p |
values := OrderedCollection with: 1.
acc := 1.
p := 2.
[acc * p <= 1000000] whileTrue: [
    (isPrime value: p) ifTrue: [acc := acc * p. values add: acc].
    p := p + 1].
values size printNl.
