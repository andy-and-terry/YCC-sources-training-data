Object subclass: Shape [ area [ ^self subclassResponsibility ] ]
Shape subclass: Sq [ | s | s: x [ s := x ] area [ ^s * s ] ]
Shape subclass: Rect [ | w h | w: a h: b [ w := a. h := b ] area [ ^w * h ] ]
Transcript showCr: (Sq new s: 3; area) printString.
Transcript showCr: (Rect new w: 2 h: 5; area) printString.
