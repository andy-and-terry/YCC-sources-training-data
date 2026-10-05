Object subclass: CollatzSequence [
    CollatzSequence class >> next: n [
        ^n even ifTrue: [ n // 2 ] ifFalse: [ 3 * n + 1 ]
    ]

    CollatzSequence class >> from: start [
        | seq n |
        seq := OrderedCollection with: start.
        n := start.
        [ n = 1 ] whileFalse: [
            n := self next: n.
            seq add: n ].
        ^seq
    ]
]

Transcript showCr: (CollatzSequence from: 6) printString.
Transcript showCr: (CollatzSequence from: 27) size printString.

| best bestLen len |
best := 1.
bestLen := 1.
1 to: 999 do: [ :i |
    len := (CollatzSequence from: i) size.
    len > bestLen ifTrue: [ best := i. bestLen := len ] ].
Transcript showCr: 'Longest under 1000: ', best printString, ' (', bestLen printString, ' terms)'.
