Object subclass: Rot47Cipher [
    Rot47Cipher class >> rot47: aString [
        ^aString collect: [:c | | n |
            n := c value.
            (n between: 33 and: 126)
                ifTrue: [Character value: 33 + ((n - 33 + 47) \\ 94)]
                ifFalse: [c]]
    ]
]

(Rot47Cipher rot47: 'Hello, World!') displayNl.
(Rot47Cipher rot47: (Rot47Cipher rot47: 'Hello, World!')) displayNl.
