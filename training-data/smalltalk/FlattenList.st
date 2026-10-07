Object subclass: FlattenList [
    FlattenList class >> flatten: aCollection [
        | result |
        result := OrderedCollection new.
        self flatten: aCollection into: result.
        ^result
    ]

    FlattenList class >> flatten: item into: result [
        (item isKindOf: Collection) & (item isString not)
            ifTrue: [ item do: [ :each | self flatten: each into: result ] ]
            ifFalse: [ result add: item ]
    ]
]

Transcript showCr: (FlattenList flatten: #(1 #(2 #(3 4)) #() #(#(5)) 6)) printString.
Transcript showCr: (FlattenList flatten: #('ab' #($c #(#d)))) printString.
