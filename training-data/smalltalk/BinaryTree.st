Object subclass: TreeNode [
    | value left right |
    value [ ^value ]
    value: v [ value := v ]
    left [ ^left ]
    left: l [ left := l ]
    right [ ^right ]
    right: r [ right := r ]
]

Object subclass: BinaryTree [
    BinaryTree class >> insert: node value: v [
        | newNode |
        node isNil ifTrue: [
            newNode := TreeNode new.
            newNode value: v.
            ^newNode
        ].
        v < node value
            ifTrue: [ node left: (self insert: node left value: v) ]
            ifFalse: [ v > node value ifTrue: [ node right: (self insert: node right value: v) ] ].
        ^node
    ]

    BinaryTree class >> inorder: node into: result [
        node isNil ifTrue: [ ^result ].
        self inorder: node left into: result.
        result add: node value.
        self inorder: node right into: result.
        ^result
    ]
]

| root result |
root := nil.
#(5 3 8 1 4 7 9) do: [ :v | root := BinaryTree insert: root value: v ].
result := OrderedCollection new.
Transcript showCr: (BinaryTree inorder: root into: result) printString.
