Object subclass: SlidingWindowMaximum [
    SlidingWindowMaximum class >> of: anArray windowSize: k [
        | deque result |
        deque := OrderedCollection new.
        result := OrderedCollection new.
        1 to: anArray size do: [ :i |
            (deque isEmpty not and: [ (deque first) <= (i - k) ]) ifTrue: [ deque removeFirst ].
            [ deque isEmpty not and: [ (anArray at: deque last) <= (anArray at: i) ] ]
                whileTrue: [ deque removeLast ].
            deque addLast: i.
            i >= k ifTrue: [ result add: (anArray at: deque first) ].
        ].
        ^result asArray
    ]
]

Transcript showCr: (SlidingWindowMaximum of: #(1 3 -1 -3 5 3 6 7) windowSize: 3) printString.
