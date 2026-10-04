Object subclass: Finder [
    findFirstEven: aCollection [
        aCollection do: [:each | each even ifTrue: [^each]].
        ^nil
    ]
]

| f |
f := Finder new.
Transcript showCr: (f findFirstEven: #(1 3 6 8)) printString.
Transcript showCr: (f findFirstEven: #(1 3 5)) printString.
Transcript showCr: (#(4 5 6) detect: [:x | x > 4] ifNone: [0]) printString.
Transcript showCr: (#(4 5 6) detect: [:x | x > 9] ifNone: ['none']) printString.
Transcript showCr: (#(1 2 3) inject: 0 into: [:a :e | a + e]) printString.
