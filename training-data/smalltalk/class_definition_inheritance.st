Object subclass: Animal [
    | name |
    Animal class >> named: aName [ ^self new setName: aName ]
    setName: aName [ name := aName ]
    name [ ^name ]
    speak [ ^'...' ]
    describe [ ^name, ' says ', self speak ]
    printOn: aStream [ aStream nextPutAll: 'Animal(', name, ')' ]
]

Animal subclass: Dog [
    | tricks |
    speak [ ^'Woof' ]
    learn: aTrick [ tricks isNil ifTrue: [tricks := OrderedCollection new]. tricks add: aTrick ]
    tricks [ ^tricks ifNil: [#()] ]
]

Animal subclass: Cat [
    speak [ ^'Meow' ]
    describe [ ^super describe, '!' ]
]

| d c |
d := Dog named: 'Rex'.
d learn: 'sit'; learn: 'roll'.
c := Cat named: 'Tom'.
Transcript showCr: d describe; showCr: c describe; showCr: d tricks printString; showCr: d printString.
Transcript showCr: (d isKindOf: Animal) printString; showCr: (d respondsTo: #learn:) printString; showCr: d class superclass name.
