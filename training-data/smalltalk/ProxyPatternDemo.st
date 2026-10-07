Object subclass: RealImage [
    | name |
    name: aString [ name := aString. Transcript showCr: 'Loading ', name ]
    display [ Transcript showCr: 'Displaying ', name ]
]

Object subclass: ImageProxy [
    | name image |
    name: aString [ name := aString ]
    display [
        image isNil ifTrue: [ image := RealImage new name: name; yourself ].
        image display
    ]
]

| p |
p := ImageProxy new name: 'photo.png'; yourself.
p display.
p display.
