Object subclass: JaccardSimilarity [
    JaccardSimilarity class >> of: a and: b [
        | sa sb union inter |
        sa := a asSet.
        sb := b asSet.
        union := sa copy addAll: sb; yourself.
        inter := sa select: [:x | sb includes: x].
        union isEmpty ifTrue: [^1].
        ^inter size / union size
    ]
]

(JaccardSimilarity of: #(1 2 3 4) and: #(3 4 5)) printNl.
