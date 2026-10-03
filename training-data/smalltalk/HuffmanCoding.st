Object subclass: HuffmanNode [
    | symbol freq left right |
    symbol [ ^symbol ] symbol: s [ symbol := s ]
    freq [ ^freq ] freq: f [ freq := f ]
    left [ ^left ] left: l [ left := l ]
    right [ ^right ] right: r [ right := r ]
    isLeaf [ ^left isNil and: [ right isNil ] ]
]

Object subclass: HuffmanCoding [
    HuffmanCoding class >> codesFor: freqTable [
        | nodes codes |
        nodes := OrderedCollection new.
        freqTable keysAndValuesDo: [ :sym :f |
            nodes add: (HuffmanNode new symbol: sym; freq: f; yourself).
        ].
        [ nodes size > 1 ] whileTrue: [
            | sorted a b merged |
            sorted := nodes asSortedCollection: [ :x :y | x freq <= y freq ].
            a := sorted first.
            b := sorted at: 2.
            merged := HuffmanNode new left: a; right: b; freq: a freq + b freq; yourself.
            nodes remove: a. nodes remove: b. nodes add: merged.
        ].
        codes := Dictionary new.
        self assign: nodes first prefix: '' into: codes.
        ^codes
    ]

    HuffmanCoding class >> assign: node prefix: prefix into: codes [
        node isLeaf
            ifTrue: [ codes at: node symbol put: prefix ]
            ifFalse: [
                self assign: node left prefix: prefix, '0' into: codes.
                self assign: node right prefix: prefix, '1' into: codes.
            ].
    ]
]

| freqs codes |
freqs := Dictionary new.
freqs at: #a put: 5; at: #b put: 9; at: #c put: 12; at: #d put: 13.
codes := HuffmanCoding codesFor: freqs.
Transcript showCr: codes printString.
