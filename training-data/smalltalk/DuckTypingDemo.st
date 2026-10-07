Object subclass: Duck [
    speak [ ^'Quack' ]
]

Object subclass: Robot [
    speak [ ^'Beep' ]
]

Object subclass: Rock [
]

| things |
things := OrderedCollection new.
things add: Duck new; add: Robot new; add: Rock new.

things do: [ :each |
    (each respondsTo: #speak)
        ifTrue: [ Transcript showCr: each class name, ' says ', each speak ]
        ifFalse: [ Transcript showCr: each class name, ' cannot speak' ] ].

Transcript showCr: (3 respondsTo: #printString) printString.
Transcript showCr: (3 respondsTo: #speak) printString.
Transcript showCr: (things collect: [ :t | t class name ]) printString.
Transcript showCr: (things select: [ :t | t respondsTo: #speak ]) size printString.
Transcript showCr: (#(1 $a 'str' #sym 2.5) collect: [ :x | x class name ]) printString.
