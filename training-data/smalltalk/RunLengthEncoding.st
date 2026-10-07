Object subclass: RunLengthEncoding [
    RunLengthEncoding class >> encode: aString [
        | stream count previous |
        aString isEmpty ifTrue: [ ^'' ].
        stream := WriteStream on: String new.
        previous := aString first.
        count := 1.
        2 to: aString size do: [ :i |
            | ch |
            ch := aString at: i.
            ch = previous
                ifTrue: [ count := count + 1 ]
                ifFalse: [
                    stream nextPutAll: count printString; nextPut: previous.
                    previous := ch.
                    count := 1.
                ]
        ].
        stream nextPutAll: count printString; nextPut: previous.
        ^stream contents
    ]
]

Transcript showCr: (RunLengthEncoding encode: 'aaabbbccd').
Transcript showCr: (RunLengthEncoding encode: 'wwwwaaadexxxxxx').
