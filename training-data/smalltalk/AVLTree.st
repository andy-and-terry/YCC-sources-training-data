Object subclass: AVLNode [
    | value left right height |
    value [ ^value ]
    value: v [ value := v ]
    left [ ^left ]
    left: l [ left := l ]
    right [ ^right ]
    right: r [ right := r ]
    height [ ^height ]
    height: h [ height := h ]
]

Object subclass: AVLTree [
    AVLTree class >> nodeHeight: node [
        ^node isNil ifTrue: [ 0 ] ifFalse: [ node height ]
    ]

    AVLTree class >> balanceFactor: node [
        ^(self nodeHeight: node left) - (self nodeHeight: node right)
    ]

    AVLTree class >> updateHeight: node [
        node height: 1 + ((self nodeHeight: node left) max: (self nodeHeight: node right))
    ]

    AVLTree class >> rotateRight: node [
        | newRoot |
        newRoot := node left.
        node left: newRoot right.
        newRoot right: node.
        self updateHeight: node.
        self updateHeight: newRoot.
        ^newRoot
    ]

    AVLTree class >> rotateLeft: node [
        | newRoot |
        newRoot := node right.
        node right: newRoot left.
        newRoot left: node.
        self updateHeight: node.
        self updateHeight: newRoot.
        ^newRoot
    ]

    AVLTree class >> insert: node value: v [
        | balance |
        node isNil ifTrue: [
            | newNode |
            newNode := AVLNode new.
            newNode value: v.
            newNode height: 1.
            ^newNode
        ].
        v < node value
            ifTrue: [ node left: (self insert: node left value: v) ]
            ifFalse: [ node right: (self insert: node right value: v) ].
        self updateHeight: node.
        balance := self balanceFactor: node.
        (balance > 1 and: [ v < node left value ]) ifTrue: [ ^self rotateRight: node ].
        (balance < -1 and: [ v > node right value ]) ifTrue: [ ^self rotateLeft: node ].
        (balance > 1 and: [ v > node left value ]) ifTrue: [
            node left: (self rotateLeft: node left).
            ^self rotateRight: node
        ].
        (balance < -1 and: [ v < node right value ]) ifTrue: [
            node right: (self rotateRight: node right).
            ^self rotateLeft: node
        ].
        ^node
    ]

    AVLTree class >> inorder: node into: result [
        node isNil ifTrue: [ ^result ].
        self inorder: node left into: result.
        result add: node value.
        self inorder: node right into: result.
        ^result
    ]
]

| root result |
root := nil.
#(10 20 30 40 50 25) do: [ :v | root := AVLTree insert: root value: v ].
result := OrderedCollection new.
Transcript showCr: (AVLTree inorder: root into: result) printString.
Transcript showCr: root value printString.
