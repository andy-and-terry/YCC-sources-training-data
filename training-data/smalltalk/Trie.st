Object subclass: TrieNode [
    | children isEnd |
    TrieNode class >> new [
        | n |
        n := super new.
        n setUp.
        ^n
    ]
    setUp [ children := Dictionary new. isEnd := false ]
    children [ ^children ]
    isEnd [ ^isEnd ]
    isEnd: aBoolean [ isEnd := aBoolean ]
]

Object subclass: Trie [
    | root |
    Trie class >> new [
        | t |
        t := super new.
        t setUp.
        ^t
    ]
    setUp [ root := TrieNode new ]

    insert: aWord [
        | node |
        node := root.
        aWord do: [ :ch |
            (node children includesKey: ch)
                ifFalse: [ node children at: ch put: TrieNode new ].
            node := node children at: ch.
        ].
        node isEnd: true.
    ]

    contains: aWord [
        | node |
        node := root.
        aWord do: [ :ch |
            (node children includesKey: ch)
                ifFalse: [ ^false ].
            node := node children at: ch.
        ].
        ^node isEnd
    ]

    startsWith: aPrefix [
        | node |
        node := root.
        aPrefix do: [ :ch |
            (node children includesKey: ch)
                ifFalse: [ ^false ].
            node := node children at: ch.
        ].
        ^true
    ]
]

| trie |
trie := Trie new.
trie insert: 'cat'.
trie insert: 'car'.
trie insert: 'card'.
Transcript showCr: (trie contains: 'cat') printString.
Transcript showCr: (trie contains: 'ca') printString.
Transcript showCr: (trie startsWith: 'ca') printString.
Transcript showCr: (trie startsWith: 'do') printString.
