Object subclass: LongestPalindromicSubstring [
    LongestPalindromicSubstring class >> in: s [
        | best expand |
        s isEmpty ifTrue: [ ^'' ].
        best := s copyFrom: 1 to: 1.
        expand := [ :left :right |
            | l r |
            l := left. r := right.
            [ l >= 1 and: [ r <= s size and: [ (s at: l) = (s at: r) ] ] ]
                whileTrue: [ l := l - 1. r := r + 1 ].
            s copyFrom: l + 1 to: r - 1
        ].
        1 to: s size do: [ :i |
            | odd even |
            odd := expand value: i value: i.
            odd size > best size ifTrue: [ best := odd ].
            even := expand value: i value: i + 1.
            even size > best size ifTrue: [ best := even ].
        ].
        ^best
    ]
]

Transcript showCr: (LongestPalindromicSubstring in: 'babad').
Transcript showCr: (LongestPalindromicSubstring in: 'cbbd').
Transcript showCr: (LongestPalindromicSubstring in: 'a').
