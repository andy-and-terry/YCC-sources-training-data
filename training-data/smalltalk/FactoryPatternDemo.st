Object subclass: Shape [
    area [ ^self subclassResponsibility ]
]

Shape subclass: Circle [
    | radius |
    radius: r [ radius := r ]
    area [ ^radius * radius * 355 / 113 ]
]

Shape subclass: Square [
    | side |
    side: s [ side := s ]
    area [ ^side * side ]
]

Object subclass: ShapeFactory [
    ShapeFactory class >> create: kind with: value [
        kind = #circle ifTrue: [ ^Circle new radius: value; yourself ].
        kind = #square ifTrue: [ ^Square new side: value; yourself ].
        ^self error: 'unknown shape kind'
    ]
]

| shapes |
shapes := OrderedCollection new.
shapes add: (ShapeFactory create: #circle with: 3).
shapes add: (ShapeFactory create: #square with: 4).
shapes do: [ :s | Transcript showCr: s area printString ].
