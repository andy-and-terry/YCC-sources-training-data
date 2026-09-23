Object subclass: Sheep [
    | name weight tags |
    name: n weight: w tags: t [ name := n. weight := w. tags := t ]
    name [ ^name ]
    name: n [ name := n ]
    weight [ ^weight ]
    tags [ ^tags ]
    cloneSheep [ ^self deepCopy ]
    printOn: aStream [
        aStream nextPutAll: 'Sheep(', name, ', ', weight printString, ', ', tags printString, ')'
    ]
]

| dolly clone1 |
dolly := Sheep new name: 'Dolly' weight: 45 tags: (OrderedCollection withAll: #('cloned' 'sheep')).
clone1 := dolly cloneSheep.
clone1 name: 'Dolly II'.
clone1 tags add: 'first-clone'.

Transcript showCr: dolly printString.
Transcript showCr: clone1 printString.
