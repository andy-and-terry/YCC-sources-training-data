Object subclass: RabinKarpSearch [
    RabinKarpSearch class >> search: text pattern: pattern [
        | n m base prime patternHash textHash highOrder |
        n := text size.
        m := pattern size.
        m = 0 ifTrue: [ ^0 ].
        m > n ifTrue: [ ^-1 ].
        base := 256.
        prime := 101.
        highOrder := 1.
        1 to: m - 1 do: [ :i | highOrder := (highOrder * base) \\ prime ].

        patternHash := 0.
        textHash := 0.
        1 to: m do: [ :i |
            patternHash := ((patternHash * base) + (pattern at: i) asInteger) \\ prime.
            textHash := ((textHash * base) + (text at: i) asInteger) \\ prime.
        ].

        1 to: n - m + 1 do: [ :i |
            (patternHash = textHash and: [ (text copyFrom: i to: i + m - 1) = pattern ])
                ifTrue: [ ^i - 1 ].
            i < (n - m + 1) ifTrue: [
                textHash := (((textHash - (((text at: i) asInteger * highOrder) \\ prime)) * base)
                    + ((text at: i + m) asInteger)) \\ prime.
                textHash < 0 ifTrue: [ textHash := textHash + prime ].
            ]
        ].
        ^-1
    ]
]

Transcript showCr: (RabinKarpSearch search: 'abxabcabcaby' pattern: 'abcaby') printString.
Transcript showCr: (RabinKarpSearch search: 'hello world' pattern: 'xyz') printString.
