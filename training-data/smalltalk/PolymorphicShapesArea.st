Object subclass: Shape [
    area [ ^self subclassResponsibility ]
    describe [ ^self class name, ' area=', self area printString ]
]

Shape subclass: Rect [
    | w h |
    Rect class >> w: a h: b [ ^self new setW: a h: b ]
    setW: a h: b [ w := a. h := b ]
    area [ ^w * h ]
]

Shape subclass: Circle [
    | r |
    Circle class >> r: x [ ^self new setR: x ]
    setR: x [ r := x ]
    area [ ^r * r * 355 / 113 ]
]

Shape subclass: Tri [
    | b h |
    Tri class >> b: x h: y [ ^self new setB: x h: y ]
    setB: x h: y [ b := x. h := y ]
    area [ ^b * h / 2 ]
]

| shapes |
shapes := OrderedCollection new.
shapes add: (Rect w: 3 h: 4); add: (Circle r: 2); add: (Tri b: 6 h: 5).
shapes do: [ :s | Transcript showCr: s describe ].
Transcript showCr: (shapes inject: 0 into: [ :a :s | a + s area ]) printString.
