Object subclass: ListNode [
    | value next |
    value [ ^value ]
    value: v [ value := v ]
    next [ ^next ]
    next: n [ next := n ]
]

Object subclass: SinglyLinkedList [
    | head tail size |
    SinglyLinkedList class >> new [
        | l |
        l := super new.
        l setHead.
        ^l
    ]
    setHead [ head := nil. tail := nil. size := 0 ]
    size [ ^size ]
    isEmpty [ ^size = 0 ]

    addLast: v [
        | node |
        node := ListNode new value: v; yourself.
        head isNil
            ifTrue: [ head := node. tail := node ]
            ifFalse: [ tail next: node. tail := node ].
        size := size + 1.
    ]

    removeFirst [
        | v |
        v := head value.
        head := head next.
        head isNil ifTrue: [ tail := nil ].
        size := size - 1.
        ^v
    ]

    do: aBlock [
        | node |
        node := head.
        [ node isNil ] whileFalse: [
            aBlock value: node value.
            node := node next.
        ]
    ]

    asArray [
        | result |
        result := OrderedCollection new.
        self do: [ :v | result add: v ].
        ^result asArray
    ]
]

| list |
list := SinglyLinkedList new.
#(10 20 30) do: [ :v | list addLast: v ].
Transcript showCr: list asArray printString.
Transcript showCr: list removeFirst printString.
Transcript showCr: list asArray printString.
