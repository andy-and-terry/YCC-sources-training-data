Object subclass: TrieNode [
    | children isEndOfWord |
    TrieNode class >> new [
        | n |
        n := super new.
        n setChildren.
        ^n
    ]
    setChildren [ children := Dictionary new. isEndOfWord := false ]
    children [ ^children ]
    isEndOfWord [ ^isEndOfWord ]
    isEndOfWord: aBoolean [ isEndOfWord := aBoolean ]
]

Object subclass: Trie [
    | root |
    Trie class >> new [
        | t |
        t := super new.
        t setRoot.
        ^t
    ]
    setRoot [ root := TrieNode new ]

    insert: aWord [
        | node |
        node := root.
        aWord do: [ :ch |
            node := node children at: ch ifAbsentPut: [ TrieNode new ]
        ].
        node isEndOfWord: true
    ]

    search: aWord [
        | node |
        node := root.
        aWord do: [ :ch |
            (node children includesKey: ch)
                ifTrue: [ node := node children at: ch ]
                ifFalse: [ ^false ]
        ].
        ^node isEndOfWord
    ]
]

| trie |
trie := Trie new.
#('cat' 'car' 'card') do: [ :w | trie insert: w ].
Transcript showCr: (trie search: 'car') printString.
Transcript showCr: (trie search: 'ca') printString.
