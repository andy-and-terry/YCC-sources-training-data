Object subclass: ZAlgorithm [
    ZAlgorithm class >> zArrayOf: text [
        | n z left right k |
        n := text size.
        z := Array new: n withAll: 0.
        left := 1. right := 1.
        2 to: n do: [ :i |
            i <= right ifTrue: [
                z at: i put: ((right - i + 1) min: (z at: i - left + 1)).
            ].
            [ (i + (z at: i)) <= n and: [ (text at: (z at: i) + 1) = (text at: i + (z at: i)) ] ]
                whileTrue: [ z at: i put: (z at: i) + 1 ].
            (i + (z at: i) - 1) > right ifTrue: [ left := i. right := i + (z at: i) - 1 ].
        ].
        ^z
    ]

    ZAlgorithm class >> search: text for: pattern [
        | combined z positions patLen |
        combined := pattern, '$', text.
        z := self zArrayOf: combined.
        patLen := pattern size.
        positions := OrderedCollection new.
        1 to: z size do: [ :i |
            (z at: i) = patLen ifTrue: [ positions add: i - patLen - 1 ].
        ].
        ^positions
    ]
]

Transcript showCr: (ZAlgorithm search: 'ababcabcabababd' for: 'abab') printString.
