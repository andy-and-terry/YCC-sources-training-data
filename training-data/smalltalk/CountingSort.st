Object subclass: CountingSort [
    CountingSort class >> sort: aCollection [
        | max counts result index |
        aCollection isEmpty ifTrue: [ ^#() ].
        max := aCollection inject: 0 into: [ :m :n | m max: n ].
        counts := Array new: max + 1 withAll: 0.
        aCollection do: [ :n | counts at: n + 1 put: (counts at: n + 1) + 1 ].
        result := OrderedCollection new.
        index := 0.
        counts do: [ :c |
            c timesRepeat: [ result add: index ].
            index := index + 1.
        ].
        ^result asArray
    ]
]

Transcript showCr: (CountingSort sort: #(4 2 2 8 3 3 1)) printString.
