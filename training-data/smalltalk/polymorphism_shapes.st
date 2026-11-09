Object subclass: Shape [ area [ ^self subclassResponsibility ] ]
Shape subclass: Square [
    | s | s: x [ s := x ] area [ ^s * s ]
]
Shape subclass: Rect [
    | w h | w: a h: b [ w := a. h := b ] area [ ^w * h ]
]
(Square new s: 3; yourself) area printNl.
(Rect new w: 2 h: 5; yourself) area printNl.
