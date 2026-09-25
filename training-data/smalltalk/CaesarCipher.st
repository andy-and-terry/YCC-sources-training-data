Object subclass: CaesarCipher [
    CaesarCipher class >> encode: aString shift: n [
        | stream |
        stream := WriteStream on: String new.
        aString do: [ :ch |
            ch isLetter
                ifTrue: [ stream nextPut: (self shiftChar: ch by: n) ]
                ifFalse: [ stream nextPut: ch ]
        ].
        ^stream contents
    ]

    CaesarCipher class >> shiftChar: ch by: n [
        | base offset |
        base := ch isUppercase ifTrue: [ $A asInteger ] ifFalse: [ $a asInteger ].
        offset := (ch asInteger - base + n) \\ 26.
        ^Character value: base + offset
    ]

    CaesarCipher class >> decode: aString shift: n [
        ^self encode: aString shift: 26 - (n \\ 26)
    ]
]

Transcript showCr: (CaesarCipher encode: 'Hello, World!' shift: 3).
Transcript showCr: (CaesarCipher decode: (CaesarCipher encode: 'Hello, World!' shift: 3) shift: 3).
