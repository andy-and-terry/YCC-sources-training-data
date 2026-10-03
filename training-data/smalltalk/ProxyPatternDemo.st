Object subclass: RealImage [
    | filename |
    filename: f [
        filename := f.
        Transcript showCr: 'loading ', filename, ' from disk'.
    ]
    display [ Transcript showCr: 'displaying ', filename. ]
]

Object subclass: ImageProxy [
    | filename realImage |
    filename: f [ filename := f ]
    display [
        realImage isNil ifTrue: [ realImage := RealImage new filename: filename; yourself ].
        realImage display.
    ]
]

| proxy |
proxy := ImageProxy new filename: 'photo.png'; yourself.
Transcript showCr: 'proxy created, nothing loaded yet'.
proxy display.
proxy display.
