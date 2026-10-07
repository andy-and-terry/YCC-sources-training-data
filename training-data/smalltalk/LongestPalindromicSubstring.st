Object subclass: LongestPalindromicSubstring [
    LongestPalindromicSubstring class >> in: aString [
        | best |
        best := ''.
        1 to: aString size do: [ :center |
            | odd even |
            odd := self expandFrom: aString left: center right: center.
            even := self expandFrom: aString left: center right: center + 1.
            odd size > best size ifTrue: [ best := odd ].
            even size > best size ifTrue: [ best := even ].
        ].
        ^best
    ]

    LongestPalindromicSubstring class >> expandFrom: aString left: l right: r [
        | left right |
        left := l.
        right := r.
        [ left >= 1 and: [ right <= aString size and: [ (aString at: left) = (aString at: right) ] ] ]
            whileTrue: [ left := left - 1. right := right + 1 ].
        ^aString copyFrom: left + 1 to: right - 1
    ]
]

Transcript showCr: (LongestPalindromicSubstring in: 'babad').
Transcript showCr: (LongestPalindromicSubstring in: 'cbbd').
