Object subclass: UnionFind [
    | parent |
    UnionFind class >> new: n [
        | uf |
        uf := self new.
        uf setParent: n.
        ^uf
    ]
    setParent: n [
        parent := (1 to: n) asArray copy.
    ]
    find: x [
        (parent at: x) = x ifTrue: [ ^x ].
        ^self find: (parent at: x)
    ]
    union: x with: y [
        | rootX rootY |
        rootX := self find: x.
        rootY := self find: y.
        rootX = rootY ifFalse: [ parent at: rootX put: rootY ].
    ]
]

| uf |
uf := UnionFind new: 5.
uf union: 1 with: 2.
uf union: 2 with: 3.
Transcript showCr: ((uf find: 1) = (uf find: 3)) printString.
Transcript showCr: ((uf find: 1) = (uf find: 4)) printString.
