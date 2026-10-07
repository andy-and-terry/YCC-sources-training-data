Object subclass: MergeIntervals [
    MergeIntervals class >> merge: intervals [
        | sorted result last |
        sorted := intervals asSortedCollection: [ :a :b | (a at: 1) <= (b at: 1) ].
        result := OrderedCollection new.
        sorted do: [ :interval |
            (result isEmpty)
                ifTrue: [ result add: interval copy ]
                ifFalse: [
                    last := result last.
                    (interval at: 1) <= (last at: 2)
                        ifTrue: [ last at: 2 put: ((last at: 2) max: (interval at: 2)) ]
                        ifFalse: [ result add: interval copy ].
                ].
        ].
        ^result
    ]
]

| intervals |
intervals := OrderedCollection new.
intervals add: #(1 3); add: #(2 6); add: #(8 10); add: #(15 18).
Transcript showCr: (MergeIntervals merge: intervals) printString.
