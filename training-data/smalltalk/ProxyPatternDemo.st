Object subclass: RealImage [
    | fileName |
    fileName: f [
        fileName := f.
        Transcript showCr: 'loading image from disk: ', fileName
    ]
    display [ Transcript showCr: 'displaying ', fileName ]
]

Object subclass: ProxyImage [
    | fileName realImage |
    fileName: f [ fileName := f ]
    display [
        realImage isNil ifTrue: [ realImage := RealImage new fileName: fileName; yourself ].
        realImage display
    ]
]

| image |
image := ProxyImage new fileName: 'photo.png'; yourself.
Transcript showCr: 'proxy created, nothing loaded yet'.
image display.
image display.
