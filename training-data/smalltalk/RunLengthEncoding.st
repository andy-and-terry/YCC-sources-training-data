Object subclass: RunLengthEncoding [
    RunLengthEncoding class >> encode: s [
        | result i n count |
        n := s size.
        n = 0 ifTrue: [ ^'' ].
        result := WriteStream on: String new.
        i := 1.
        [ i <= n ] whileTrue: [
            | ch |
            ch := s at: i.
            count := 1.
            [ i + count <= n and: [ (s at: i + count) = ch ] ]
                whileTrue: [ count := count + 1 ].
            result nextPutAll: count printString.
            result nextPut: ch.
            i := i + count.
        ].
        ^result contents
    ]

    RunLengthEncoding class >> decode: s [
        | result i n numStart |
        result := WriteStream on: String new.
        n := s size.
        i := 1.
        [ i <= n ] whileTrue: [
            | ch count numStr |
            numStart := i.
            [ (s at: i) isDigit ] whileTrue: [ i := i + 1 ].
            numStr := s copyFrom: numStart to: i - 1.
            count := numStr asInteger.
            ch := s at: i.
            count timesRepeat: [ result nextPut: ch ].
            i := i + 1.
        ].
        ^result contents
    ]
]

Transcript showCr: (RunLengthEncoding encode: 'aaabbbcccc').
Transcript showCr: (RunLengthEncoding decode: (RunLengthEncoding encode: 'aaabbbcccc')).
Transcript showCr: (RunLengthEncoding encode: 'abcd').
