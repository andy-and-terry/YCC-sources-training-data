Object subclass: Shape [
    area [ ^self subclassResponsibility ]
]
Shape subclass: Sq [
    | s |
    s: x [ s := x ]
    area [ ^s * s ]
]
Shape subclass: Rect [
    | w h |
    w: a h: b [ w := a. h := b ]
    area [ ^w * h ]
]

(Sq new s: 3; yourself) area printNl.
(Rect new w: 3 h: 4; yourself) area printNl.
