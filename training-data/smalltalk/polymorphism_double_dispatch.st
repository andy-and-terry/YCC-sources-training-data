Object subclass: Shape [ areaWith: aVisitor [ ^self subclassResponsibility ] ]
Shape subclass: Circle [
    | r | Circle class >> r: x [ ^self new setR: x ] setR: x [ r := x ] r [ ^r ]
    accept: v [ ^v visitCircle: self ]
]
Shape subclass: Rect [
    | w h | Rect class >> w: a h: b [ ^self new setW: a h: b ] setW: a h: b [ w := a. h := b ] w [ ^w ] h [ ^h ]
    accept: v [ ^v visitRect: self ]
]
Object subclass: AreaVisitor [
    visitCircle: c [ ^c r * c r * 355 / 113 ]
    visitRect: r [ ^r w * r h ]
]
Object subclass: NameVisitor [
    visitCircle: c [ ^'circle' ]
    visitRect: r [ ^'rect' ]
]
| shapes |
shapes := OrderedCollection new.
shapes add: (Circle r: 2); add: (Rect w: 3 h: 4).
shapes do: [:s | Transcript showCr: (s accept: NameVisitor new), ' ', (s accept: AreaVisitor new) printString].
Transcript showCr: ([Shape new areaWith: nil] on: Error do: [:e | 'abstract']).
Transcript showCr: (3 + 4.5) printString; showCr: (1/2 + 0.5) printString; showCr: (3 + (1/2)) printString.
