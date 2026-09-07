Object subclass: MinHeap [
    | items |
    MinHeap class >> new [
        | h |
        h := super new.
        h setItems.
        ^h
    ]
    setItems [ items := OrderedCollection new ]
    isEmpty [ ^items isEmpty ]
    size [ ^items size ]

    push: value [
        items add: value.
        self bubbleUp: items size
    ]

    bubbleUp: index [
        | parentIndex temp |
        index = 1 ifTrue: [ ^self ].
        parentIndex := index // 2.
        (items at: index) < (items at: parentIndex) ifTrue: [
            temp := items at: index.
            items at: index put: (items at: parentIndex).
            items at: parentIndex put: temp.
            self bubbleUp: parentIndex
        ]
    ]

    pop [
        | top last |
        top := items first.
        last := items removeLast.
        items isEmpty ifFalse: [
            items at: 1 put: last.
            self bubbleDown: 1
        ].
        ^top
    ]

    bubbleDown: index [
        | left right smallest temp |
        left := index * 2.
        right := index * 2 + 1.
        smallest := index.
        (left <= items size and: [ (items at: left) < (items at: smallest) ]) ifTrue: [ smallest := left ].
        (right <= items size and: [ (items at: right) < (items at: smallest) ]) ifTrue: [ smallest := right ].
        smallest ~= index ifTrue: [
            temp := items at: index.
            items at: index put: (items at: smallest).
            items at: smallest put: temp.
            self bubbleDown: smallest
        ]
    ]
]

| heap |
heap := MinHeap new.
#(5 3 8 1 9 2) do: [ :v | heap push: v ].
[ heap isEmpty ] whileFalse: [ Transcript showCr: heap pop printString ].
