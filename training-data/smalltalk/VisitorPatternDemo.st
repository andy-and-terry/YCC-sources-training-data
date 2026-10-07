Object subclass: Circle [
    | radius |
    radius: r [ radius := r ]
    radius [ ^radius ]
    acceptVisitor: aVisitor [ ^aVisitor visitCircle: self ]
]

Object subclass: Rectangle [
    | width height |
    width: w height: h [ width := w. height := h ]
    width [ ^width ]
    height [ ^height ]
    acceptVisitor: aVisitor [ ^aVisitor visitRectangle: self ]
]

Object subclass: AreaVisitor [
    visitCircle: aCircle [ ^(aCircle radius * aCircle radius) * Float pi ]
    visitRectangle: aRectangle [ ^aRectangle width * aRectangle height ]
]

Object subclass: DescriptionVisitor [
    visitCircle: aCircle [ ^'circle(r=', aCircle radius printString, ')' ]
    visitRectangle: aRectangle [ ^'rectangle(', aRectangle width printString, 'x', aRectangle height printString, ')' ]
]

| shapes areaVisitor descVisitor |
shapes := OrderedCollection new.
shapes add: (Circle new radius: 2); add: (Rectangle new width: 3 height: 4).
areaVisitor := AreaVisitor new.
descVisitor := DescriptionVisitor new.

shapes do: [ :shape |
    Transcript showCr: (shape acceptVisitor: descVisitor), ' -> area ', (shape acceptVisitor: areaVisitor) printString
].
