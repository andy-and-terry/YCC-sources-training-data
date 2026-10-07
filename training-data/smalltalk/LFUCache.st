Object subclass: LFUCache [
    | capacity values freqs |
    LFUCache class >> new: cap [
        | c |
        c := super new.
        c setCapacity: cap.
        ^c
    ]

    setCapacity: cap [
        capacity := cap.
        values := Dictionary new.
        freqs := Dictionary new.
    ]

    get: key [
        (values includesKey: key) ifFalse: [ ^nil ].
        freqs at: key put: (freqs at: key) + 1.
        ^values at: key
    ]

    put: key value: value [
        (values includesKey: key) ifTrue: [
            values at: key put: value.
            freqs at: key put: (freqs at: key) + 1.
            ^self
        ].
        values size >= capacity ifTrue: [
            | leastKey leastFreq |
            leastFreq := nil.
            values keysDo: [ :k |
                (leastFreq isNil or: [ (freqs at: k) < leastFreq ]) ifTrue: [
                    leastFreq := freqs at: k. leastKey := k.
                ].
            ].
            values removeKey: leastKey.
            freqs removeKey: leastKey.
        ].
        values at: key put: value.
        freqs at: key put: 1.
    ]
]

| cache |
cache := LFUCache new: 2.
cache put: 1 value: 'a'.
cache put: 2 value: 'b'.
cache get: 1.
cache put: 3 value: 'c'.
Transcript showCr: (cache get: 2) printString.
Transcript showCr: (cache get: 3) printString.
