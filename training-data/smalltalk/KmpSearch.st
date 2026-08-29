Object subclass: KmpSearch [
    KmpSearch class >> buildLps: pattern [
        | n lps len i |
        n := pattern size.
        lps := Array new: n withAll: 0.
        len := 0.
        i := 2.
        [ i <= n ] whileTrue: [
            (pattern at: i) = (pattern at: len + 1)
                ifTrue: [
                    len := len + 1.
                    lps at: i put: len.
                    i := i + 1.
                ]
                ifFalse: [
                    len ~= 0
                        ifTrue: [ len := lps at: len ]
                        ifFalse: [ lps at: i put: 0. i := i + 1. ].
                ].
        ].
        ^lps
    ]

    KmpSearch class >> search: text pattern: pattern [
        | lps n m i j |
        lps := self buildLps: pattern.
        n := text size.
        m := pattern size.
        i := 1. j := 1.
        [ i <= n ] whileTrue: [
            (text at: i) = (pattern at: j)
                ifTrue: [
                    i := i + 1. j := j + 1.
                    j > m ifTrue: [ ^i - j ].
                ]
                ifFalse: [
                    j > 1
                        ifTrue: [ j := lps at: j - 1 ]
                        ifFalse: [ i := i + 1 ].
                ].
        ].
        ^-1
    ]
]

Transcript showCr: (KmpSearch search: 'abxabcabcaby' pattern: 'abcaby') printString.
