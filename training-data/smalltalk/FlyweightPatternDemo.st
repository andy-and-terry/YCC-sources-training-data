Object subclass: TreeType [
    | name color texture |
    name: n color: c texture: t [ name := n. color := c. texture := t ]
    drawAt: x y: y [
        Transcript showCr: 'drawing ', color, ' ', name, ' (', texture, ') at (',
            x printString, ', ', y printString, ')'
    ]
]

Object subclass: TreeFactory [
    TreeFactory class [ | treeTypes | ]
    TreeFactory class >> treeTypesDict [
        treeTypes isNil ifTrue: [ treeTypes := Dictionary new ].
        ^treeTypes
    ]
    TreeFactory class >> name: n color: c texture: t [
        | key |
        key := n, '-', c, '-', t.
        ^self treeTypesDict at: key ifAbsentPut: [ TreeType new name: n color: c texture: t ]
    ]
    TreeFactory class >> typeCount [ ^self treeTypesDict size ]
]

Object subclass: Tree [
    | x y treeType |
    x: ax y: ay type: t [ x := ax. y := ay. treeType := t ]
    draw [ treeType drawAt: x y: y ]
]

| trees |
trees := OrderedCollection new.
trees add: (Tree new x: 1 y: 2 type: (TreeFactory name: 'Oak' color: 'green' texture: 'rough')).
trees add: (Tree new x: 3 y: 4 type: (TreeFactory name: 'Oak' color: 'green' texture: 'rough')).
trees add: (Tree new x: 5 y: 6 type: (TreeFactory name: 'Pine' color: 'dark green' texture: 'needled')).

trees do: [ :t | t draw ].
Transcript showCr: 'distinct flyweights created: ', TreeFactory typeCount printString.
