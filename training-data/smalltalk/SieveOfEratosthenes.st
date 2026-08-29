Object subclass: SieveOfEratosthenes [
    SieveOfEratosthenes class >> primesUpTo: limit [
        | isComposite result |
        isComposite := Array new: limit + 1 withAll: false.
        2 to: limit sqrtFloor do: [ :i |
            (isComposite at: i + 1) ifFalse: [
                (i * i) to: limit by: i do: [ :j |
                    isComposite at: j + 1 put: true.
                ].
            ].
        ].
        result := OrderedCollection new.
        2 to: limit do: [ :n |
            (isComposite at: n + 1) ifFalse: [ result add: n ].
        ].
        ^result
    ]
]

Transcript showCr: (SieveOfEratosthenes primesUpTo: 50) printString.
