| digits i done |
digits := OrderedCollection withAll: #(9 9).
done := false.
i := digits size.
[i >= 1 and: [done not]] whileTrue: [
    (digits at: i) < 9
        ifTrue: [digits at: i put: (digits at: i) + 1. done := true]
        ifFalse: [digits at: i put: 0].
    i := i - 1].
done ifFalse: [digits addFirst: 1].
Transcript showCr: digits printString. "OrderedCollection(1 0 0)"
