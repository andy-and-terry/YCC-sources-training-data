Object subclass: AffineCipher [
    AffineCipher class >> encrypt: text a: a b: b [
        ^text collect: [:ch |
            ch isUppercase
                ifTrue: [Character value: 65 + ((a * (ch value - 65) + b) \\ 26)]
                ifFalse: [ch]]
    ]
]

(AffineCipher encrypt: 'AFFINE' a: 5 b: 8) displayNl.
