Object subclass: StreamReadWriteDemo [
    StreamReadWriteDemo class >> buildGreeting: name [
        | stream |
        stream := WriteStream on: String new.
        stream nextPutAll: 'Hello, '.
        stream nextPutAll: name.
        stream nextPut: $!.
        ^stream contents
    ]

    StreamReadWriteDemo class >> sumDigits: aString [
        | stream total ch |
        stream := ReadStream on: aString.
        total := 0.
        [ stream atEnd ] whileFalse: [
            ch := stream next.
            ch isDigit ifTrue: [ total := total + ch digitValue ].
        ].
        ^total
    ]
]

Transcript showCr: (StreamReadWriteDemo buildGreeting: 'World').
Transcript showCr: (StreamReadWriteDemo sumDigits: 'a1b2c3') printString.
