Object subclass: SpiralMatrix [
    SpiralMatrix class >> traverse: matrix [
        | result top bottom left right |
        result := OrderedCollection new.
        top := 1.
        bottom := matrix size.
        left := 1.
        right := (matrix at: 1) size.
        [ top <= bottom and: [ left <= right ] ] whileTrue: [
            left to: right do: [ :c | result add: ((matrix at: top) at: c) ].
            top := top + 1.
            top to: bottom do: [ :r | result add: ((matrix at: r) at: right) ].
            right := right - 1.
            top <= bottom ifTrue: [
                right to: left by: -1 do: [ :c | result add: ((matrix at: bottom) at: c) ].
                bottom := bottom - 1 ].
            left <= right ifTrue: [
                bottom to: top by: -1 do: [ :r | result add: ((matrix at: r) at: left) ].
                left := left + 1 ] ].
        ^result
    ]
]

Transcript showCr: (SpiralMatrix traverse: #(#(1 2 3 4) #(5 6 7 8) #(9 10 11 12))) printString.
Transcript showCr: (SpiralMatrix traverse: #(#(1 2) #(3 4))) printString.
