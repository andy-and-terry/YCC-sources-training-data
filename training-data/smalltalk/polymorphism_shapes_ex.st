Object subclass: Shape [ area [ ^self subclassResponsibility ] ]
Shape subclass: Sq [ | s | s: x [ s := x ] area [ ^s * s ] ]
Shape subclass: Rc [ | w h | w: a h: b [ w := a. h := b ] area [ ^w * h ] ]

{ Sq new s: 3; yourself. Rc new w: 2 h: 5; yourself } do: [:sh |
    Transcript showCr: sh area printString].
